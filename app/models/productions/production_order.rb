# encoding: utf-8
class Productions::ProductionOrder < ActiveRecord::Base

  WMS_STATION_NO = 1001
  TEST_STATION_NO = 1009
  PRODUCT_ROBOT_NO = 3001

  self.table_name = "mj_production_base"

  belongs_to :plan, :class_name => 'Productions::Plan'
  has_many :orders, :class_name => 'Productions::WorkOrder', foreign_key: :production_id
  has_one :one_tcs_order, :class_name => 'Tcs::Order', foreign_key: :production_id, dependent: :destroy # 因为有个字段叫tcs_order
  has_many :transport_orders, :class_name => 'Wms::TransportOrder', foreign_key: :production_order_id
  # has_many :tcs_order_lines,  through: :tcs_order
  has_many :logistics_chains,  -> { order "sequence" }, class_name: "Productions::LogisticsChain", foreign_key: :production_order_id
  belongs_to :product, :class_name => 'Products::Product', foreign_key: :product_id

  before_create :set_production_no, :set_production_name
  after_create :generate_work_orders, :create_tcs_order, :generate_tcs_order_lines
  before_validation :set_status, :set_production_no
  after_save :generate_wms_transport_order
  after_commit :generate_logistics_chains

  def set_production_name
    if !self.name
      self.name =  "#{self.product.name}的生产订单"
    end
  end

  def set_production_no
    if !self.production_no
      self.production_no = "PO#{Time.now.to_i}"
    end
  end

  def set_status
      self.status = "draft" if self.status.blank?
  end

  state_machine :status, :initial => :draft do
    event :start do
      transition [:draft] => :processing
    end
    event :finish do
      transition [:processing] => :finished
    end
    # after_transition :draft => :start do |record, transition|
    #   record.create_wms_transfer_order
    # end
  end

  def create_tcs_order
   self.build_one_tcs_order(order_name: "#{self.production_no}--物流配送单").save
  end

  # after_create to generate work_order
  def generate_work_orders
    product.routing.operations.each do |operation|
        self.orders.create(
            sequence: operation.sequence,
            operation_name: operation.name,
            status: 'draft',
            operation: operation
        )
    end
  end

  # AGV 调拨单
  def generate_tcs_order_lines
    if self.product.no.to_i == PRODUCT_ROBOT_NO
      create_robot_tcs_order_lines
    else
      create_nc_tcs_order_lines
    end
  end

  def generate_wms_transport_order
    if !self.new_record?
      create_wms_transport_order
    end
  end

  def generate_logistics_chains
    if !self.new_record?
      tcs_order_lines = self.one_tcs_order.tcs_order_lines.collect{|order_line| order_line}
      transport_orders = Wms::TransportOrder.where(production_order_id: self.id)
      chains = [
          tcs_order_lines.shift,
          transport_orders.first,
          tcs_order_lines,
          transport_orders.last
      ]
      if chains
        chains.flatten.each_with_index do |chain, index|
          self.logistics_chains.create(owner: chain, sequence: index+1)
        end
      end
    end
  end

  def action_start
    # if self.status == 'draft'
      self.start
      self.logistics_chains.first.owner.action_start
      self.orders.first.tap do |order|
        order.action_start if order
      end
      self.one_tcs_order.action_start
      self
    # else
    #   false
    # end
  end

  def send_xml
    host =  Settings.tcs.send_xml_server.ip
    port =  33333
    client_socket = TCPSocket.new(host, port)
    client_socket.write(self.to_xml)
    client_socket.close_write # Send EOF after writing the request.
    parse_xml(client_socket.read)
  end

  def to_xml
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.ProductionOrder("xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance") {
        xml.workorder("device" => "1", "program_no" => "6001")
      }
    end
    builder.to_xml
  end

  def parse_xml(data)
    # TODO
  end

  def self.parse_receive_xml
    host =  Settings.tcs.receive_xml_server.ip
    port =  33334

    tr = Thread.new do
      begin
        socket = TCPSocket.open(host, port)
        started = true
        accumulated_text  = ""
        while(line  = socket.readline && started)
          accumulated_text += line
          if accumulated_text.include?("|")
            split_xml_data = accumulated_text.split('|')
            xml_data = split_xml_data[0]
            # TODO ...
            # ParseAgvStatusWorker.perform_async(xml_data)
            accumulated_text = split_xml_data[1]
          end
        end
      rescue Exception => e
        socket.close if socket
        started = false
      end
    end
    tr.join
  end


  private

  def create_wms_transport_order
    # 出库
    bom_line = if self.product.finished? || self.product.semi_finished?
                 self.product.bom.bom_lines.try(:first)
               else
                 self.product
               end
    if bom_line
      tray = Wms::TransportUnit.find_or_create_by(one_product: bom_line.product)

      # 给这个托盘分配库存，主要为了演示
      tray.location = Wms::Location.allot_one_in
      tray.save!

      transport_order = tray.create_transport_order('out', 1, self)
      # transport_order.update!(production_order_id: self.id)
    end

    tray = Wms::TransportUnit.find_or_create_by(one_product: self.product)
    transport_order = tray.create_transport_order('in', 1, self)
    # transport_order.update!(production_order_id: self.id)

    # 入库 # 等到生产完成的时候，给其分配一个托盘

  end

  def create_nc_tcs_order_lines
    operations = [WMS_STATION_NO] << self.product.workstation_nos << TEST_STATION_NO

    operations.flatten.uniq.each do |workstation_no|
      self.one_tcs_order.tcs_order_lines.create!(
          action: 'transport',
          destination_name: workstation_no.to_s,
          vehicle_type_available: false,
          # intended_vehicle: 'robot',
          operation: 'OP_WAIT'
      )
    end
  end

  def create_robot_tcs_order_lines
    [WMS_STATION_NO, 1010, 1011, 1012, 1013, 1014, WMS_STATION_NO].each_with_index do |workstation_no, index|
      operation = index == 6  ? 'NOP' : 'OP_WAIT'
      self.one_tcs_order.tcs_order_lines.create!(
          action: 'transport',
          destination_name: workstation_no,
          vehicle_type_available: false,
          # intended_vehicle: 'robot',
          operation: operation
      )
    end
  end

end
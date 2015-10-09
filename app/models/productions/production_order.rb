# encoding: utf-8
class Productions::ProductionOrder < ActiveRecord::Base

  WMS_STATION_NO = 1001
  TEST_STATION_NO = 1009
  PRODUCT_ROBOT_NO = 3001

  self.table_name = "mj_production_base"

  belongs_to :plan, :class_name => 'Productions::Plan'
  has_many :orders, :class_name => 'Productions::WorkOrder', foreign_key: :production_id
  belongs_to :product, :class_name => 'Products::Product', foreign_key: :product_id
  has_one :one_tcs_order, :class_name => 'Tcs::Order', foreign_key: :production_id, dependent: :destroy # 因为有个字段叫tcs_order
  has_many :transport_orders, :class_name => 'Wms::TransportOrder', foreign_key: :production_order_id
  # has_many :tcs_order_lines,  through: :tcs_order
  has_many :logistics_chains,  -> { order "sequence" }, class_name: "Productions::LogisticsChain", foreign_key: :production_order_id

  before_create :set_production_no, :set_production_name
  after_create :generate_work_orders, :create_tcs_order, :generate_tcs_order_lines, :generate_wms_transport_order, :generate_logistics_chains
  before_validation :set_status

  def set_production_name
    if !self.name
      self.name =  "#{self.product.name}的生产订单"
    end
  end

  def set_production_no
    self.production_no = "PO#{Time.now.to_i}"
  end

  def set_status
    self.status = "draft"
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
            status: 'draft'
        )
    end
  end

  # AGV 调拨单
  def generate_tcs_order_lines
    if self.product.no == PRODUCT_ROBOT_NO
      create_robot_tcs_order_lines
    else
      create_nc_tcs_order_lines
    end
  end

  def generate_wms_transport_order
    create_wms_transport_order
  end

  def generate_logistics_chains
    tcs_order_lines = self.one_tcs_order.tcs_order_lines.collect{|order_line| order_line}
    transport_orders = self.transport_orders.collect{|order| order}
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

  def action_start
    if self.status == 'draft'
      self.start
      self.orders.first.tap do |order|
        order.action_start if order
      end
      self.one_tcs_order.action_start
      self
    else
      false
    end
  end

  private

  def create_wms_transport_order
    # 出库
    bom_line = self.product.bom.bom_lines.try(:first)
    if bom_line
      tray = Wms::TransportUnit.find_or_create_by(one_product: bom_line.product)
      tray.create_transport_order('out', 1)
    end

    tray = Wms::TransportUnit.find_or_create_by(one_product: self.product)
    tray.create_transport_order('in', 1)

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
    [WMS_STATION_NO, 1010, 1011, 1012, 1013, 1014, WMS_STATION_NO].each do |workstation_no|
      self.one_tcs_order.tcs_order_lines.create!(
          action: 'transport',
          destination_name: workstation_no,
          vehicle_type_available: false,
          # intended_vehicle: 'robot',
          operation: 'OP_WAIT'
      )
    end
  end

end
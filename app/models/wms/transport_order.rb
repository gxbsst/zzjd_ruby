# encoding: utf-8
class Wms::TransportOrder < ActiveRecord::Base
  self.table_name = "wms_transport_order"
  belongs_to :one_transport_unit, :class_name => 'Wms::TransportUnit', foreign_key: :transport_unit
  belongs_to :one_target_location, class_name: 'Wms::Location', foreign_key: :target_location
  belongs_to :one_source_location, class_name: 'Wms::Location', foreign_key: :source_location
  has_many  :logistics_chains, :class_name => 'Productions::LogisticsChain', as: :owner
  # state  = created || initialized || started || interrupted || onfailure || canceled || finished

  before_validation :set_state

  def set_state
    self.state = 'created'
  end


  state_machine :state, :initial => :created do
    event :initialize do
      transition [:created] => :initialized
    end

    event :start do
      transition [:initialized] => :started
    end

    event :interrupt do
      transition all => :interrupted
    end

    event :failure do
      transition all => :onfailure
    end

    event :cancel do
      transition all => :canceled
    end

    event :finish do
      transition all => :finish
    end
  end

  def action_start

    if in_stock?
      in_stock
    elsif out_stock?
      out_stock
    else
      raise '未知动作'
    end

  end

  def in_stock
    puts("正在入库中....")
    # location.update!(incoming_active: false)
    duiduiche = Equipments::Duiduoche.build

    #duiduiche.in_stock self.one_target_location.no, 1 # TODO: 1， 为库位, 1 为出料口
    duiduiche.in_stock 3, 1 # TODO: 1， 为库位, 1 为出料口

    check_work_done_status(duiduiche, self)
  end

  def out_stock
    puts("正在出库中....")
    # duiduiche = Equipments::Duiduoche.build
    # duiduiche.out_stock 1, 1 # TODO: 1， 为库位, 1 为出料口
    duiduiche = Equipments::Duiduoche.build
    # duiduiche.out_stock self.one_source_location.no, 1 # TODO: 1， 为库位, 1 为出料口
    duiduiche.out_stock 3, 1 # TODO: 1， 为库位, 1 为出料口
    check_work_done_status(duiduiche, self)
  end

  def check_work_done_status(duiduiche, order)
    tr = Thread.new do
      work_done = false
      while !work_done
        if duiduiche.work_done?
          puts "*"*10 + "work done" + "*"*10
          work_done = true
          # TODO:
          # 更新调拨单的状态
          order.finish
          # 更新物流链某条记录的状态
          logistics = order.logistics_chains.try(:first)
          logistics.update!(status: 'finished') if logistics

          if order.out_stock?
            order.one_transport_unit.unlink_products
          end
          Thread.exit
        end
      end
    end
    tr.join
  end

  def in_stock?
    location = self.one_source_location
    (location.x.to_i == 0 && location.y.to_i == 0 && location.z.to_i ==0) || (location.x.to_i == 0 && location.y.to_i == 0 && location.z.to_i ==1)
  end

  def out_stock?
    location = self.one_target_location
    (location.x.try(:to_i) == 0 && location.y.try(:to_i) == 0 && location.z.try(:to_i)==0) || (location.x.to_i == 0 && location.y.to_i == 0 && location.z.to_i ==1)
  end
end

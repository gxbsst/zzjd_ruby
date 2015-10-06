# encoding: utf-8
class Wms::TransportOrder < ActiveRecord::Base
  self.table_name = "wms_transport_order"
  belongs_to :one_transport_unit, :class_name => 'Wms::TransportUnit', foreign_key: :transport_unit
  # state  = created || initialized || started || interrupted || onfailure || canceled || finished


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

  end

  def in_stock
    Rails.logger.info("正在入库中....")
    # location.update!(incoming_active: false)
    # duiduiche = Equipments::Duiduoche.build
    # duiduiche.in_stock 1, 1 # TODO: 1， 为库位, 1 为出料口

    # check_work_done_status(duiduiche)
  end

  def out_stock
    Rails.logger.info("正在出库中....")
    # duiduiche = Equipments::Duiduoche.build
    # duiduiche.out_stock 1, 1 # TODO: 1， 为库位, 1 为出料口
    # check_work_done_status(duiduiche)
  end

  def check_work_done_status(duiduiche)
    tr = Thread.new do
      while !work_done
        if duiduiche.work_done?
          work_done = true
          Thread.exit
        end
      end
    end
    tr.join
  end
end

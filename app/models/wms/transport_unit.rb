# encoding: utf-8
class Wms::TransportUnit < ActiveRecord::Base
  self.table_name = "wms_transport_unit"
  belongs_to :one_product, foreign_key: :product_id, class_name: Products::Product
  belongs_to :location, :class_name => 'Wms::Location', foreign_key: :actual_location
  has_many :transport_orders, :class_name => 'Wms::TransportOrder', foreign_key: :transport_unit

  before_create :set_barcode

  def set_barcode
   self.barcode = Time.now.to_i + Random.rand(11)
  end

  #STATE = available/ok/not_ok

  # exist_no: 出料口
  def create_transport_order(action, exit_no = 2)
    if exit_no == 2
      exit_location = {
          x:0, y:0, z:1, area: 2, no: 101, aisle: 1
      }
    elsif exit_no == 1
      exit_location = {
          x: 0, y: 0, z: 0, area: 2, no: 100, aisle: 1
      }
    end
    # TODO:
    # 在location给一号料台设置一个location
    if action == 'in'
      source_location = Wms::Location.find_or_create_by(exit_location) #  二号出料口
      target_location  = Wms::Location.allot_one_in
      self.transport_orders.create(one_target_location: target_location, one_source_location: source_location)
    else
      source_location = Wms::Location.allot_one_out(self.one_product)
      target_location  = Wms::Location.find_or_create_by(exit_location) # 二号出料口
      self.transport_orders.create(one_target_location: target_location, one_source_location: source_location)
    end
  end

  # 添加货物
  def add_products(product, quantity = 1)
    self.empty = false
    self.product_id = product.id
    self.product_quantity = quantity
    self.save
  end

  # 清除货物
  def unlink_products
    self.empty = true
    self.product_id = nil
    self.product_quantity = 0
    self.save
  end

  alias_method :bind_barcode, :add_products
end

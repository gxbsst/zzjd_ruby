# encoding: utf-8
class Wms::TransportUnit < ActiveRecord::Base
  self.table_name = "wms_transport_unit"
  belongs_to :one_product, foreign_key: :product_id, class_name: Products::Product
  belongs_to :location, :class_name => 'Wms::Location', foreign_key: :actual_location
  has_many :transport_orders, :class_name => 'Wms::TransportOrder', foreign_key: :transport_unit

  #STATE = available/ok/not_ok

  def create_transport_order(action)
    # TODO:
    # 在location给一号料台设置一个location
    if action == 'in'
      source_location = Wms::Location.find_or_create_by(x:0, y:0, z:1, area: 2, no: 101, aisle: 1) #  二号出料口
      target_location  = Wms::Location.allot_one_in
      self.transport_orders.create(target_location: target_location, source_location: source_location)
    else
      source_location = Wms::Location.allot_one_out(self.one_product)
      target_location  = Wms::Location.find_or_create_by(x:0, y:0, z:1, area: 2, no: 101, aisle: 1) # 二号出料口
      self.transport_orders.create(target_location: target_location, source_location: source_location)
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

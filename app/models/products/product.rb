class Products::Product < ActiveRecord::Base
  self.table_name = "mj_product_base"

  has_one :bom, :class_name => 'Products::Bom', foreign_key: :product

  def self.pub
      $mqtt.publish('test', 'message')
  end
end

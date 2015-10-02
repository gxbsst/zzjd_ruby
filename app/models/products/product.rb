class Products::Product < ActiveRecord::Base
  self.table_name = "mj_product_base"

  has_one :bom, :class_name => 'Products::Bom', foreign_key: :product
  has_one :routing, :class_name => 'TechManagements::Routing', foreign_key: :product_id

  def self.pub
      $mqtt.publish('test', 'message')
  end

  def workstation_nos
    self.routing.workstations.collect(&:no)
  end
  alias_attribute :no, :product_no
end

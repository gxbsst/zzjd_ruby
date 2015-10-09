class Products::Product < ActiveRecord::Base
  self.table_name = "mj_product_base"

  has_one :bom, :class_name => 'Products::Bom', foreign_key: :product_id
  has_one :routing, :class_name => 'TechManagements::Routing', foreign_key: :product_id
  has_many :transport_units, :class_name => 'Wms::TransportUnit', foreign_key: :product_id
  has_many :covers,-> { where owner_type: "mj_product_product_cover" }, :class_name => 'Bases::Resource', foreign_key: :owner_id
  def self.pub
      $mqtt.publish('test', 'message')
  end

  def workstation_nos
    self.routing.workstations.collect(&:no)
  end
  alias_attribute :no, :product_no
end

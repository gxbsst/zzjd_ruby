class Products::Product < ActiveRecord::Base
  self.table_name = "mj_product_base"

  has_one :bom, :class_name => 'Products::Bom', foreign_key: :product_id
  has_one :routing, :class_name => 'TechManagements::Routing', foreign_key: :product_id
  has_many :transport_units, :class_name => 'Wms::TransportUnit', foreign_key: :product_id
  has_many :covers,-> { where owner_type: "mj_product_product_blueprint" }, :class_name => 'Bases::Resource', foreign_key: :owner_id
  def self.pub
      $mqtt.publish('test', 'message')
  end

  def workstation_nos
    self.routing.workstations.collect(&:no)
  end

  def finished? # 成品-机器人
   self.product_type == 'finished'
  end

  def semi_finished? # 办成品-机器人
    self.product_type == 'semi-finished'
  end

  def material? # 办成品-机器人
    self.product_type == 'material?'
  end

  alias_attribute :no, :product_no
end

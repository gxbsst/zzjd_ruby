class TechManagements::Routing < ActiveRecord::Base
  self.table_name = "mj_tm_routing"
  has_many :operations, :class_name => 'TechManagements::Operation'
  has_many :workstations, :class_name => 'Workcenters::Workstation', through: :operations
  belongs_to :product, :class_name => 'Products::Product'
end

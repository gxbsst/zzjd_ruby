class TechManagements::Operation < ActiveRecord::Base
  self.table_name = "mj_tm_operation"

  # has_many product or material
  belongs_to :workstation, :class_name => 'Workcenters::Workstation'
  has_many :materials, :class_name => 'TechManagements::Material', foreign_key: :operation_id
  has_many :resources,-> { where owner_type: "mj_technological_management_operation_guide" }, :class_name => 'Bases::Resource', foreign_key: :owner_id
end

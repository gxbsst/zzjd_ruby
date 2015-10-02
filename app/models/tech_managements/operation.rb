class TechManagements::Operation < ActiveRecord::Base
  self.table_name = "mj_tm_operation"

  # has_many product or material
  belongs_to :workstation, :class_name => 'Workcenters::Workstation'
end

class Projects::Project < ActiveRecord::Base
  self.table_name = "mj_project_base"

  has_many :members, :class_name => 'Projects::Member'
end

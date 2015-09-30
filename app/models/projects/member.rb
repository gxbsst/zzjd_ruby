class Projects::Member < ActiveRecord::Base
  self.table_name = "mj_project_base_user"

  belongs_to :project, :class_name => 'Projects::Project'
end

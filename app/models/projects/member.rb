class Projects::Member < ActiveRecord::Base
  self.table_name = "mj_project_user_base"

  belongs_to :project, :class_name => 'Projects::Project'
end

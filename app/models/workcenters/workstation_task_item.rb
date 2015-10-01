class Workcenters::WorkstationTaskItem < ActiveRecord::Base
  self.table_name = 'workcenters_workstation_task_items'

  belongs_to :task, :class_name => 'Workcenters::WorkstationTask', foreign_key: :task_id
end

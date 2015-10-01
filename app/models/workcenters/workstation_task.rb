class Workcenters::WorkstationTask < ActiveRecord::Base
  self.table_name = "workcenters_workstation_tasks"

  belongs_to :workstation, :class_name => 'Workcenters::Workstation'
  has_many :task_items, :class_name => 'Workcenters::WorkstationTaskItem', foreign_key: :task_id
end

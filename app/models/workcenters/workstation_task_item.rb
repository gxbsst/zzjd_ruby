# encoding: utf-8
# 每个工位上设备执行的任务列表
# 如： 机器人抓零件
#      NC门打开
# step:1, name: agv arrive, no: 0001
class Workcenters::WorkstationTaskItem < ActiveRecord::Base
  self.table_name = 'workcenters_workstation_task_items'

  belongs_to :task, :class_name => 'Workcenters::WorkstationTask', foreign_key: :task_id
end

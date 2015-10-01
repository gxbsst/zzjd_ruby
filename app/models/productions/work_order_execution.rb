class Productions::WorkOrderExecution < ActiveRecord::Base
  self.table_name = 'productions_work_order_executions'
  belongs_to :work_order, :class_name => 'Productions::WorkOrder'
end

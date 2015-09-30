class Productions::Plan < ActiveRecord::Base
  self.table_name = "mj_production_plan_base"
  has_many :productions_production_orders, class_name: 'Productions::ProductionOrder'
end
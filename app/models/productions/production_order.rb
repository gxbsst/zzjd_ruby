class Productions::ProductionOrder < ActiveRecord::Base
  self.table_name = "mj_production_base"

  belongs_to :plan, :class_name => 'Productions::Plan'
  has_many :orders, :class_name => 'Productions::WorkOrder'


  # TODO
  # after_create to generate work_order
end
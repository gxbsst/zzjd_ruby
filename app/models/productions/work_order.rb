class Productions::WorkOrder < ActiveRecord::Base
  self.table_name = "mj_work_order_base"

  belongs_to :production_order, :class_name => 'Productions::ProductionOrder'
  belongs_to :workstation, :class_name => 'Workcenters::Workstation', foreign_key: :work_station

end

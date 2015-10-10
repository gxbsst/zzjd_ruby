class Productions::WorkOrder < ActiveRecord::Base
  self.table_name = "mj_work_order_base"

  belongs_to :production_order, :class_name => 'Productions::ProductionOrder', foreign_key: :production_id
  belongs_to :workstation, :class_name => 'Workcenters::Workstation', foreign_key: :work_station_id
# =======
#   belongs_to :production_order, :class_name => 'Productions::ProductionOrder'
#   belongs_to :workstation, :class_name => 'Workcenters::Workstation', foreign_key: :work_station_id
#   belongs_to :operation, :class_name => 'TechManagements::Operation', foreign_key: :routing_operation_id
# >>>>>>> 5bbff246a9e5c2aa4a6477ed72e7270503ab7baa

  state_machine :status, :initial => :draft do
    event :start do
      transition [:draft] => :processing
    end
    event :finish do
      transition [:processing] => :finished
    end
  end

  def action_start
    self.start
  end



end

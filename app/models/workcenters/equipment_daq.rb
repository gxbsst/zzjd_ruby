class Workcenters::EquipmentDaq < ActiveRecord::Base
  belongs_to :equipment, :class_name => 'Workcenters::Equipment'

  self.table_name = "workcenters_equipment_daq"
end

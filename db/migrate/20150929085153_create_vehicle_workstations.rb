class CreateVehicleWorkstations < ActiveRecord::Migration
  def change
    create_table :mj_vehicle_workstations do |t|

      t.string :workstation_no
      t.string :vehicle_no

      t.timestamps null: false
    end
  end
end

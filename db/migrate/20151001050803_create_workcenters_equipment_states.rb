class CreateWorkcentersEquipmentStates < ActiveRecord::Migration
  def change
    create_table :workcenters_equipment_daq do |t|
      t.string :name
      t.integer :equipment_id
      t.string :address
      t.string :value

      t.text :description

      t.timestamps null: false
    end
  end
end

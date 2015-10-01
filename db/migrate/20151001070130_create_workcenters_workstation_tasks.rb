class CreateWorkcentersWorkstationTasks < ActiveRecord::Migration
  def change
    create_table :workcenters_workstation_tasks do |t|
      t.integer :workstation_id
      t.string :name
      t.string :no
      t.timestamps null: false
    end
  end
end

class CreateWorkcentersWorkstationTaskItems < ActiveRecord::Migration
  def change
    create_table :workcenters_workstation_task_items do |t|
      t.integer :task_id
      t.string :no
      t.string :name
      t.integer :step

      t.timestamps null: false
    end
  end
end

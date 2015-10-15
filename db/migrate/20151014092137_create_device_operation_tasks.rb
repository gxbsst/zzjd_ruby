class CreateDeviceOperationTasks < ActiveRecord::Migration
  def change
    create_table :device_operation_tasks do |t|
      t.string :device_name
      t.string :task_name
      t.string :operation_name
      t.string :params
      t.string :status

      t.timestamps null: false
    end
  end
end

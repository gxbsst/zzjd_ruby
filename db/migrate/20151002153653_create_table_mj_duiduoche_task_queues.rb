class CreateTableMjDuiduocheTaskQueues < ActiveRecord::Migration
  def change
    create_table :mj_duiduoche_task_queues do |t|
      t.integer :work_order_id
      t.string :task
      t.string :state
    end
  end
end

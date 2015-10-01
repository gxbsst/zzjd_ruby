class CreateProductionsWorkOrderExecutions < ActiveRecord::Migration
  def change
    create_table :productions_work_order_executions do |t|
      t.integer :work_order_id
      t.string :type
      t.string :state

      t.timestamps null: false
    end
  end
end

class AddOperationToMjTcsOrderTaskBase < ActiveRecord::Migration
  def change
    add_column :mj_tcs_order_task_base, :operation, :string
  end
end

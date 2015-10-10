class AddLocationNameToMjTcsOrderTaskBase < ActiveRecord::Migration
  def change
    add_column :mj_tcs_order_task_base, :location_name, :string
  end
end

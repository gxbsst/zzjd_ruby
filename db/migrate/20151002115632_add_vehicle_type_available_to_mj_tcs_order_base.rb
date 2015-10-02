class AddVehicleTypeAvailableToMjTcsOrderBase < ActiveRecord::Migration
  def change
    add_column :mj_tcs_order_task_base, :vehicle_type_available, :boolean
  end
end

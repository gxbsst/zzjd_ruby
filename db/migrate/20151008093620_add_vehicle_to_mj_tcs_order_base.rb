class AddVehicleToMjTcsOrderBase < ActiveRecord::Migration
  def change
    add_column :mj_tcs_order_base, :vehicle, :string
  end
end

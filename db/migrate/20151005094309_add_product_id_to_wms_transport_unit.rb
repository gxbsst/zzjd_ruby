class AddProductIdToWmsTransportUnit < ActiveRecord::Migration
  def change
    add_column :wms_transport_unit, :product_id, :integer
  end
end

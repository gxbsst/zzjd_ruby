class AddProductionOrderIdToWmsTransportOrder < ActiveRecord::Migration
  def change
    add_column :wms_transport_order, :production_order_id, :integer
  end
end

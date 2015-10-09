class AddStatusToProductionsLogisticsChains < ActiveRecord::Migration
  def change
    add_column :productions_logistics_chains, :status, :string
  end
end

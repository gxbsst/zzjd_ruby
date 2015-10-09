class CreateProductionsLogisticsChains < ActiveRecord::Migration
  def change
    create_table :productions_logistics_chains do |t|
      t.integer :production_order_id
      t.string :owner_type
      t.integer :owner_id
      t.integer :sequence

      t.timestamps null: false
    end

    add_index :productions_logistics_chains, :production_order_id
    add_index :productions_logistics_chains, [:owner_id, :owner_type]
  end
end

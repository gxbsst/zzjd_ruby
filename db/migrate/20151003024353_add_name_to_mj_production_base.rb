class AddNameToMjProductionBase < ActiveRecord::Migration
  def change
    add_column :mj_production_base, :name, :string
  end
end

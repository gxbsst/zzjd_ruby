class AddBomIdToMjMaterialBase < ActiveRecord::Migration
  def change
    add_column :mj_material_base, :bom_id, :integer
  end
end

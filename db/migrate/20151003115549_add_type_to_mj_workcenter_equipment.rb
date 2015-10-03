class AddTypeToMjWorkcenterEquipment < ActiveRecord::Migration
  def change
    add_column :mj_workcenter_equipments, :type, :string
  end
end

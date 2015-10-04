class AddTypeToMjWorkcenterEquipment < ActiveRecord::Migration
  def change
    add_column :mj_workcenter_equipment, :type, :string
  end
end

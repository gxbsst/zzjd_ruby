class AddTypeToMjWorkcenterWorkstation < ActiveRecord::Migration
  def change
    add_column :mj_workcenter_workstation, :type, :string
  end
end

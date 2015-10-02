class AddNoToWmsLocation < ActiveRecord::Migration
  def change
    add_column :wms_location, :no, :integer
  end
end

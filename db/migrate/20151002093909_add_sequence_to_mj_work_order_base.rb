class AddSequenceToMjWorkOrderBase < ActiveRecord::Migration
  def change
    add_column :mj_work_order_base, :sequence, :integer
  end
end

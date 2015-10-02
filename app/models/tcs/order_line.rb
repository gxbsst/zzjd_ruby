class  Tcs::OrderLine < ActiveRecord::Base
  self.table_name = "mj_tcs_order_task_base"
  belongs_to :one_tcs_order, :class_name => 'Tcs::Order', foreign_key: :tcs_order
end

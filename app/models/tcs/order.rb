class  Tcs::Order < ActiveRecord::Base
  self.table_name = "mj_tcs_order_base"
  belongs_to :production_order, :class_name => 'Productions::ProductionOrder', foreign_key: :production
  has_many :tcs_order_lines, :class_name => 'Tcs::OrderLine', foreign_key: :tcs_order, dependent: :destroy
end

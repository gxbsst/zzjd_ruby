class Productions::LogisticsChain < ActiveRecord::Base
  belongs_to :production_order, :class_name => 'Productions::ProductionOrder', foreign_key: :production_order_id
  belongs_to :owner, polymorphic: true
  self.table_name = 'productions_logistics_chains'
end

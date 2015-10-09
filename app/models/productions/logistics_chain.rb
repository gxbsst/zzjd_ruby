class Productions::LogisticsChain < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  self.table_name = 'productions_logistics_chains'
end

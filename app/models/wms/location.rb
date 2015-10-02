class Wms::Location < ActiveRecord::Base
  self.table_name = "wms_location"
  validates :x, uniqueness: {scope: [:y, :z]}
end

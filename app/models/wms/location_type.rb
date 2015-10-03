class Wms::LocationType < ActiveRecord::Base
  self.table_name = "wms_location_type"
  self.inheritance_column = :_type_disabled
end

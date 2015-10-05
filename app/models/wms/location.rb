class Wms::Location < ActiveRecord::Base
  self.table_name = "wms_location"
  validates :x, uniqueness: {scope: [:y, :z]}

  scope :area_a, -> { where area: 'area_a'}
  scope :area_b, -> { where area: 'area_b'}
end

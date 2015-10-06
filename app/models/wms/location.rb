class Wms::Location < ActiveRecord::Base
  self.table_name = "wms_location"
  validates :x, uniqueness: {scope: [:y, :z]}
  has_many :transport_unit, :class_name => 'Wms::TransportUnit', foreign_key: :actual_location
  scope :area_a, -> { where area: 'area_a'}
  scope :area_b, -> { where area: 'area_b'}
end

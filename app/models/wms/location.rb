class Wms::Location < ActiveRecord::Base
  self.table_name = "wms_location"
  validates :x, uniqueness: {scope: [:y, :z]}
  has_many :transport_unit, :class_name => 'Wms::TransportUnit', foreign_key: :actual_location
  has_many :one_products, :class_name => 'Products::Product', through: :transport_unit
  scope :area_a, -> { where area: 'area_a'}
  scope :area_b, -> { where area: 'area_b'}
  scope :available, -> { where incoming_active: [true, nil]}
  scope :unavailable, -> { where incoming_active: false}

  def self.allot_one_in
    # TODO:
    # 找到最近的库位
    self.available.order(:no).try(:first)
  end

  def self.allot_one_out(product)
    # TODO:
    # 找到最近的库位
    locations = product.transport_units.collect{|tu| tu.location }
    locations.try(:first)
  end

  def incoming_active
    if read_attribute(:incoming_active).nil?
      true
    end
    read_attribute(:incoming_active)
  end
end

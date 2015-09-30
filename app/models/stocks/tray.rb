class Stocks::Tray < ActiveRecord::Base
  self.table_name = "mj_stock_tray_base"

  # has_one Product
  # has_one Location

  has_one :product, :class_name => 'Products::Product'
  has_one :location, :class_name => 'Wms::Location'
end

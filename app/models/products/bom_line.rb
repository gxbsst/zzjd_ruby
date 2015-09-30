class Products::BomLine < ActiveRecord::Base
  self.table_name = "mj_material_base"

  belongs_to :bom, class_name:  'Products::Bom'
  belongs_to :product, class_name: "Products::Product"
end

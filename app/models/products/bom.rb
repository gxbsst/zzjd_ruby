class Products::Bom < ActiveRecord::Base
  self.table_name = "mj_bill_of_material_base"
  has_many :bom_lines, :class_name => 'Products::BomLine'
end

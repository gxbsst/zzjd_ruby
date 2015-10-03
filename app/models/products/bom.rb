class Products::Bom < ActiveRecord::Base
  self.table_name = "mj_bill_of_material_base"
  has_many :bom_lines, :class_name => 'Products::BomLine'

  alias_attribute :no, :bill_of_material_no

  # alias_attribute :product_id, :product
end

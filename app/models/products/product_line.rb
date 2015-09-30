# encoding: utf-8
# uniq product
# TODO: not create table yet.

class Products::ProductLine < ActiveRecord::Base
  self.table_name = "mj_product_line"
  belongs_to :product, class_name: 'Products::Product'

end

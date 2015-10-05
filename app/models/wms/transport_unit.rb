class Wms::TransportUnit < ActiveRecord::Base
  self.table_name = "wms_transport_unit"
  belongs_to :one_product, foreign_key: :product_id

  def bind_product(product)
    self.update! product_id: product.id
  end
end

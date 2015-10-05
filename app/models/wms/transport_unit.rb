class Wms::TransportUnit < ActiveRecord::Base
  self.table_name = "wms_transport_unit"
  belongs_to :one_product, foreign_key: :product_id

  def bind_product(product)
    self.update! product_id: product.id
  end

  def in_stock
   duiduiche = Equipments::Duiduoche.build
   duiduiche.in_stock 1, 1 # TODO: 1， 为库位, 1 为出料口
   check_work_done_status(duiduiche)
  end

  def out_stock
    duiduiche = Equipments::Duiduoche.build
    duiduiche.out_stock 1, 1 # TODO: 1， 为库位, 1 为出料口
    check_work_done_status(duiduiche)
  end

  def check_work_done_status(duiduiche)
    tr = Thread.new do
      while !work_done
        if duiduiche.work_done?
          work_done = true
        end
      end
    end
    tr.join
  end
end

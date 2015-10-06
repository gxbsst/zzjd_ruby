module Api
  module V1
    class LocationsController < BaseController

      def index
        @collections = Wms::Location.all
      end

      def bind_barcode
        @product = Products::Product.find(params[:product_id])
        @tray = Wms::TransportUnit.find_or_create_by(barcode: params[:barcode])
        if @tray && @product && @tray.empty
          @tray.add_products(@product)
          @tray.create_transport_order('in')
          head :ok
        else
          # 托盘已经被占用
          head :not_found
        end
      end

      def in_stock
        @tray = Wms::TransportUnit.find_by(barcode: params[:barcode])
        @order = @tray.transport_orders.last
        if @order
          @order.in_stock
          head :ok
        else
          head :not_found
        end
      end

      def out_stock
        @product = Products::Product.find(params[:product_id])
        @tray = Wms::TransportUnit.find_or_create_by(one_product: @product)
        @order = @tray.create_transport_order('out')

        if @tray
          @order.out_stock
          head :ok
        else
          head :not_found
        end
      end

    end
  end
end
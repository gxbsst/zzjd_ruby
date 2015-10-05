module Api
  module V1
    class LocationsController < BaseController

      def index
        @collections = Wms::Location.all
      end

      def bind_barcode
        @product = Products::Product.find(params[:product_id])
        @tray = Wms::TransportUnit.find_by(barcode: params[:barcode])
        if @product && @tray
          if @tray.bind_product(@product)
            head :ok
          else
            head :unprocessable_entity
          end
        else
          head :not_found
        end
      end

    end
  end
end
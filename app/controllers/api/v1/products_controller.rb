module Api
  module V1
    class ProductsController < BaseController

      def index
        @collections = Products::Product.all
      end

    end
  end
end
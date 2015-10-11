# encoding: utf-8
module Api
  module V1
    class ProductsController < BaseController

      def index
        @collections = Products::Product.all
      end

      # 获取半成品
      def half_product
        @collections = Products::Product.where(["product_type = ?","semi-finished"])

      end

    end
  end
end
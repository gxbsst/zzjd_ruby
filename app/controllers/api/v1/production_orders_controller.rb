#  encoding: utf-8
module Api
  module V1
    class ProductionOrdersController < BaseController

      def  index
        @collections = Productions::ProductionOrder.all
      end

      # 生产订单开始
      def start
        order = set_order
        if order.status == 'finished' || order.status == 'processing'
          head :unprocessable_entity
        else
          order.action_start
          head 200
        end
      end

      private

      def set_order
        Productions::ProductionOrder.find(params[:id])
      end
    end
  end
end
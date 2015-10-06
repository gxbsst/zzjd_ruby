#  encoding: utf-8
module Api
  module V1
    class WorkOrdersController < BaseController

      # 工单开始
      def start
        order = set_order
        if order.status == 'finished' || order.status == 'processing'
          head :unprocessable_entity
        else
          order.start
          head 200
        end
      end

      private

      def set_order
        Productions::WorkOrder.find(params[:id])
      end
    end
  end
end
module Api
  module V1
    class ProductionOrdersController < BaseController

      def  index
        @collections = Productions::ProductionOrder.all
      end

    end
  end
end
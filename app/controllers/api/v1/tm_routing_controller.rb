# encoding: utf-8
module Api
  module V1
    class TmRoutingController < BaseController

      def index
        @collections = Products::Product.all
      end



      def show

        @routing =TechManagements::Routing.find_by(["product_id=?",params[:id]])
        @operations = @routing.operations
        puts @routing.id
      end

    end
  end
end
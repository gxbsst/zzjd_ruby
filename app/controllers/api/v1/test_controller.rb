# encoding: utf-8
module Api::V1
  class TestController < BaseController

    def wms
      operation = params[:operation]
      location = params[:location]
      begin

        send_transport_order(operation, location)
        head :ok
      rescue Exception => e
        puts e
        head :unprocessable_entity
      end
    end

    def nc
      begin
        send_one_order
        head :ok
      rescue Exception => e
        head :unprocessable_entity
      end
    end

    def robot
      head :ok
    end

    private

    def send_transport_order(action = "in", location)
      if action == 'in'
        Wms::TransportOrder.first.send_xml('in', location)
      end

      if action == 'out'
        Wms::TransportOrder.first.send_xml('out', location)
      end

      if action == 'all'
        (1..62).each do |i|
          locations = [0]
          locations << (3..8).map {|i| [i,i] }.flatten
          locations.flatten!
          location = locations[i]
          if i % 2 == 1
            Wms::TransportOrder.first.send_xml('in', location)
          else
            Wms::TransportOrder.first.send_xml('out', location)
          end
        end
      end
    end

    def send_one_order
      name = "J1轴的生产计划"
      production_no = '000002'
      product_number = 1
      product = Products::Product.find_by_no(3008)
      production_order = Productions::ProductionOrder.find_or_create_by(
          production_no: production_no,
          product: product
      )

      production_order.send_xml
    end
  end
end
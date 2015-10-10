# encoding: utf-8
require 'socket'


# <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
# <tcsOrderSet>
# <order xsi:type="transport" deadline="2015-09-29 intendedVehicle="Vehicle-01" vehicleTypeAvailable="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
# <destination locationName="Recharge 02" operation="NOP"/>
# <dependency>2</dependency>
# </order>
# ... </tcsOrderSet>\r\n\r\n

module Api::V1
  class RobotsController < BaseController
    def index
      do_action
      # to_xml
      @products = Product.all
    end

    def show
      client_socket = TCPSocket.new('192.168.1.157', 55555)

      # puts to_xml
      client_socket.write(to_2_xml.to_xml)
      client_socket.close_write # Send EOF after writing the request.

      client_socket.read # Read until EOF to get the response.
    end

    def do_action
      workstation_no = params[:workstation_no]
      vehicle_no = params[:vehicle_no]
      #  找机器人
      #  机器人做事情
      #  机器人是否做完，
      #  机器人做完小车走
      #

      client_socket = TCPSocket.new('192.168.1.157', 55555)

      # puts to_xml
      client_socket.write(to_xml.to_xml)
      client_socket.close_write # Send EOF after writing the request.

      client_socket.read # Read until EOF to get the response.
    end


    def to_xml
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.tcsOrderSet {
          xml.order('xsi:type' => 'transport',
                    'deadline' => '2015-09-22T21:17:01.715+08:00',
                    'intendedVehicle' => 'Vehicle-01',
                    "vehicleTypeAvailable" => "false",
                    "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance") do
            xml.destination("locationName" => "Recharge 03", "operation" => "OP_WAIT")
            xml.destination("locationName" => "Recharge 04", "operation" => "OP_WAIT")
            xml.destination("locationName" => "Working station 03", "operation" => "OP_WAIT")
            xml.destination("locationName" => "Working station 02", "operation" => "OP_WAIT")
            xml.destination("locationName" => "Working station 01", "operation" => "OP_WAIT")
            # xml.dependency 2
          end

        }
      end

      builder
    end


    def to_2_xml
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.tcsOrderSet{
          xml.order('xsi:type' => 'transportOperationOrder',
                    'name' => 'TOrder-0001',
                    'operationName' => 'OP_WAIT',
                    "operationProgress" => "100",
                    "id" => "http://www.w3.org/2001/XMLSchema-instance") do
            # xml.dependency 2
          end

        }
      end

      builder
    end

  end
end

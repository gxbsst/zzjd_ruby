class  Tcs::Order < ActiveRecord::Base
  self.table_name = "mj_tcs_order_base"
  belongs_to :production_order, :class_name => 'Productions::ProductionOrder', foreign_key: :production
  has_many :tcs_order_lines, :class_name => 'Tcs::OrderLine', foreign_key: :tcs_order, dependent: :destroy

  def send_xml
    client_socket = TCPSocket.new('192.168.1.157', 55555)
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
end

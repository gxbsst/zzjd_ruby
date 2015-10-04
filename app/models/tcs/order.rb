class  Tcs::Order < ActiveRecord::Base
  self.table_name = "mj_tcs_order_base"
  belongs_to :production_order, :class_name => 'Productions::ProductionOrder', foreign_key: :production
  has_many :tcs_order_lines, :class_name => 'Tcs::OrderLine', foreign_key: :tcs_order, dependent: :destroy

  def send_xml
    host =  Settings.tcs.send_xml_server.ip
    port =  Settings.tcs.send_xml_server.port
    client_socket = TCPSocket.new(host, port)
    client_socket.write(self.to_xml)
    client_socket.close_write # Send EOF after writing the request.
    client_socket.read # Read until EOF to get the response.
    # TODO:
    # 通过返回的数据更新记录的用哪量小车执行
  end

  def to_xml
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.tcsOrderSet {
        xml.order('xsi:type' => 'transport',
                  'deadline' => '2015-09-22T21:17:01.715+08:00',
                  "vehicleTypeAvailable" => "false",
                  "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance") do

          self.tcs_order_lines.each do |line|
            xml.destination("locationName" => "#{line.destination_name}", "operation" => "#{line.operation}")
          end
        end

      }
    end
    builder.to_xml
  end
end

# encoding: utf-8
class  Tcs::OrderLine < ActiveRecord::Base
  self.table_name = "mj_tcs_order_task_base"
  belongs_to :one_tcs_order, :class_name => 'Tcs::Order', foreign_key: :tcs_order_id
  has_many :logistics_chains, :class_name => 'Productions::LogisticsChain', as: :owner

  # TODO:
  # to_one_xml 还未完成
  def action_start
    # send_one_xml
  end

  def self.parse_xml
    host =  Settings.tcs.receive_xml_server.ip
    port =  Settings.tcs.receive_xml_server.port

    tr = Thread.new do
      begin
        socket = TCPSocket.open(host, port)
        started = true
        accumulated_text  = ""
        while(line  = socket.readline && started)
          accumulated_text += line
          if accumulated_text.include?("|")
            split_xml_data = accumulated_text.split('|')
            xml_data = split_xml_data[0]
            ParseAgvStatusWorker.perform_async(xml_data)
            accumulated_text = split_xml_data[1]
          end
        end
      rescue Exception => e
        socket.close if socket
        started = false
      end
    end
    tr.join
  end

  # 发送一条订单的xml
  # def send_one_xml
  #   host =  Settings.tcs.send_xml_server.ip
  #   port =  Settings.tcs.send_xml_server.port
  #   client_socket = TCPSocket.new(host, port)
  #   client_socket.write(self.to_xml)
  #   client_socket.close_write # Send EOF after writing the request.
  #   client_socket.read # Read until EOF to get the response.
  #   # TODO:
  #   # 通过返回的数据更新记录的用哪量小车执行
  # end
  #
  # def to_one_xml
  #   builder = Nokogiri::XML::Builder.new do |xml|
  #     xml.tcsOrderSet {
  #       xml.order('xsi:type' => 'transport',
  #                 'deadline' => '2015-09-22T21:17:01.715+08:00',
  #                 "vehicleTypeAvailable" => "false",
  #                 "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance") do
  #
  #           xml.destination("locationName" => "#{self.destination_name}", "operation" => "#{self.operation}")
  #       end
  #
  #     }
  #   end
  #   builder.to_xml
  # end

  # 小车到下一站
  def send_next_xml
    host =  Settings.tcs.send_xml_server.ip
    port =  Settings.tcs.send_xml_server.port
    client_socket = TCPSocket.new(host, port)
    client_socket.write(self.to_next_xml)
    client_socket.close_write # Send EOF after writing the request.
    # client_socket.read # Read until EOF to get the response.
    # parse_xml(client_socket.read)
  end

  def to_next_xml
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.tcsOrderSet {
        xml.order('xsi:type' => 'transportOperationOrder',
                  "name" => "#{self.one_tcs_order.order_name}",
                  "operationName" => "#{self.operation}",
                  'operationPgress' => "100",
                  "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance") do
        end
      }
    end
    builder.to_xml
  end
end

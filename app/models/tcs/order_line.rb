class  Tcs::OrderLine < ActiveRecord::Base
  self.table_name = "mj_tcs_order_task_base"
  belongs_to :one_tcs_order, :class_name => 'Tcs::Order', foreign_key: :tcs_order

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
end

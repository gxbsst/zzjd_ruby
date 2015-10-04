require 'socket'
class MjSocket
  def self.parse_xml
    host = '192.168.3.253'     # The web server
    port = 44444 # Default HTTP port

    begin
      socket = TCPSocket.open(host, port)
      started = true
      accumulated_text  = ""
      while(echo = socket.readline && started)
        accumulated_text += echo

        if accumulated_text.include?("|")
          split_xml_data = accumulated_text.split('|')
          xml_data = split_xml_data[0]

          accumulated_text = split_xml_data[1]
        end
      end
    rescue Exception => e
      socket.close
      started = false
    end

  end
end
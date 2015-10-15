class XMLReceiver
  class AssembleLine < self

    def self.receive_xml
      host =  Settings.tcs.receive_xml_server.ip
      # host = '127.0.0.1'
      port =  33334

      tr = Thread.new do
        begin
          socket = TCPSocket.open(host, port)
          started = true
          accumulated_text  = ""
          while(line  = socket.readline && started)
            accumulated_text += line
            puts accumulated_text
          end
        rescue Exception => e
          socket.close if socket
          started = false
        end
      end
      tr.join
    end
  end
end
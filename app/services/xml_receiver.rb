class XMLReceiver
  class AssembleLine < self

    def self.receive_xml

      host =  Settings.device_management.robot.ip
      port =  Settings.device_management.robot.receive_port

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
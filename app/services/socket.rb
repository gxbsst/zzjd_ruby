require 'socket'
class MjSocket
  def self.accept_agv_notify
    host = '192.168.1.105'     # The web server
    port = 44444 # Default HTTP port
# # This is the HTTP request we send to fetch a file
#     request = "GET #{path} HTTP/1.0\r\n\r\n"

#     socket = TCPSocket.open(host,port)  # Connect to server
#     response = socket.read              # Read complete response
# # Split response at first blank line into headers and body
#     puts("*"*100)
#     puts response
#     puts("*"*100)
#     headers,body = response.split("\r\n\r\n", 2)
#     print body


    socket = TCPSocket.open(host, port)

    while line = gets()
      print(socket.readline)
    end

    while line = socket.gets   # Read lines from the socket
      puts("*"*100)
      puts line.chop      # And print with platform line terminator
      puts("*"*100)
    end
    s.close

  end
end
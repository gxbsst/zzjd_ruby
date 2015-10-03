require 'socket'
class MjSocket
  def self.accept_agv_notify
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


    host = '192.168.3.253'     # The web server
    port = 44444 # Default HTTP port
    socket = TCPSocket.open(host, port)

    # BUFFER_SIZE = 1024
    changes = ''
    loop {
      print(socket.gets().chomp)
    }

    while line = gets()
      # changes << line if line.chars.first == '|'
      print(socket.readline)
      # break if socket.readline.first == '|'
      # print(changes)
    end

    while line = socket.gets   # Read lines from the socket

      puts("*"*100)
      puts line.chop      # And print with platform line terminator
      puts("*"*100)
    end
    s.close

  end
end
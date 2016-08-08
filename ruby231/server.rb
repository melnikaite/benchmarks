require 'socket'
server = TCPServer.new('127.0.0.1', 2345)

loop do
  socket = server.accept
  response = "Hello World!\n"
  socket.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/plain\r\n" +
               "Content-Length: #{response.bytesize}\r\n" +
               "Connection: close\r\n"
  socket.print "\r\n"
  socket.print response
  socket.close
end

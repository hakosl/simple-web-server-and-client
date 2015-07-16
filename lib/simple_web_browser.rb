require 'socket'

hostname = 'localhost'
port = 2000

s = TCPSocket.open(hostname, port)

s.print("GET /index.html HTTP/1.0\r\n\r\n")

while line = s.gets
  puts line
end

s.close
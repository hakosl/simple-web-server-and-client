require 'socket'
require 'json'

server = TCPServer.open(2000)

loop do
  Thread.start(server.accept) do |client|
  	client_response = client.read_nonblock(256)
  	puts client_response
  	response = client.puts File.read('index.html')
  	
  	client.puts "HTTP/1.0 200 OK"
  	client.puts response
  	client.close
  end
end
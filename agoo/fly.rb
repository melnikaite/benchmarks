require 'agoo'

server = Agoo::Server.new(6464, '.', thread_count: 0)

class FlyHandler
  def initialize
  end

  def call(req)
    [ 200, { }, [ "flying fish" ] ]
  end
end

server.handle(:GET, "/", FlyHandler.new)
server.start()

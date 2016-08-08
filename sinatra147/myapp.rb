require 'sinatra/base'
require 'rack/handler/puma'

class App < Sinatra::Base
  get '/' do
    'Hello, World'
  end
end

Rack::Handler::Puma.run App

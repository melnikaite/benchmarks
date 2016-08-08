require 'rack/handler/puma'
require_relative './twitter'

app = Twitter::API

Rack::Handler::Puma.run app

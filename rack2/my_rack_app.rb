require 'rack/handler/puma'

app = Proc.new do |env|
  ['200', {'Content-Type' => 'text/html'}, ['A barebones rack app.']]
end

Rack::Handler::Puma.run app

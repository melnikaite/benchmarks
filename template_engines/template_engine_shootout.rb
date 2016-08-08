begin
  require 'bundler/inline'
rescue LoadError => e
  $stderr.puts 'Bundler version 1.10 or later is required. Please update your Bundler'
  raise e
end

gemfile(true) do
  source 'https://rubygems.org'

  gem 'benchmark-ips'
  gem 'erubis'
  gem 'haml'
  gem 'slim'
  gem 'tilt'
  gem 'mustache'
  gem 'liquid'
end

SCOPE  = Object.new
LOCALS = { message: 'Hello, ERB' }

TEMPLATE_ERB = Tilt::ERBTemplate.new do
<<-EOF
<html>
  <head>
    <title><%= message %></title>
  </head>
  <body>
    <h1><%= message %></h1>
  </body>
</html>
EOF
end

# Rails uses Erubis to render erb templates
TEMPLATE_ERUBIS = Tilt::ErubisTemplate.new do
<<-EOF
<html>
  <head>
    <title><%= message %></title>
  </head>
  <body>
    <h1><%= message %></h1>
  </body>
</html>
EOF
end

TEMPLATE_HAML = Tilt::HamlTemplate.new do
<<-EOF
%html
  %head
    %title= message
  %body
    %h1= message
EOF
end

TEMPLATE_SLIM = Slim::Template.new do
<<-EOF
html
  head
    title = message
  body
    h1 = message
EOF
end

TEMPLATE_MUSTACHE = Mustache.new
TEMPLATE_MUSTACHE.template =
<<-EOF
<html>
  <head>
    <title>{{message}}</title>
  </head>
  <body>
    <h1>{{message}}</h1>
  </body>
</html>
EOF

TEMPLATE_LIQUID = Liquid::Template.parse(
<<-EOF
<html>
  <head>
    <title>{{message}}</title>
  </head>
  <body>
    <h1>{{message}}</h1>
  </body>
</html>
EOF
)

Benchmark.ips do |x|
  x.report('ERB     ') do
    TEMPLATE_ERB.render(SCOPE, LOCALS)
  end

  x.report('Erubis  ') do
    TEMPLATE_ERUBIS.render(SCOPE, LOCALS)
  end

  x.report('Haml    ') do
    TEMPLATE_HAML.render(SCOPE, LOCALS)
  end

  x.report('Slim    ') do
    TEMPLATE_SLIM.render(SCOPE, LOCALS)
  end

  x.report('Mustache') do
    TEMPLATE_MUSTACHE.render(LOCALS)
  end

  x.report('Liquid  ') do
    TEMPLATE_LIQUID.render(LOCALS)
  end

  x.compare!
end

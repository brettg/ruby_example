require 'rubygems'
require 'sinatra'
require 'net/http'
require 'open-uri'

set :root, '/data'

get '/' do
  File.read('/data/index.html')
end

get '/l' do
  <<-HTML
    <pre>
      #{Dir.glob('/**/*')}
    </pre>
  HTML
end

get '/pid' do
  <<-HTML
    <h1>PID: #{Process.pid}</h1>
  HTML
end

get '/env' do
  <<-HTML
    <pre>
      #{ENV.inspect}
    </pre>
  HTML
end

get '/plat' do
  <<-HTML
    <pre>
      #{RUBY_PLATFORM}
    </pre>
  HTML
end

get '/echo' do
  <<-HTML
    <pre>
      #{system("echo", "*")}
    </pre>
  HTML
end

get '/ri' do
  <<-HTML
    <pre>
      #{system("/usr/bin/ri", "Kernel")}
    </pre>
  HTML
end


get '/s' do
  URI.parse('https://google.com').read
end

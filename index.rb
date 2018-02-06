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

get '/s' do
  URI.parse('https://google.com').read
end

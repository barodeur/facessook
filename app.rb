require 'bundler/setup'

require 'sinatra'
require 'pry'

class App < Sinatra::Base

  configure :production do
    require 'newrelic_rpm'
  end

  get '*' do
    redirect "http://facebook.com#{request.env['PATH_INFO']}", 302
  end
end

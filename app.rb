require 'bundler/setup'

require 'sinatra'
require 'pry'

class App < Sinatra::Base
  configure :production do
    require 'newrelic_rpm'
  end

  helpers do
    def protected!
      unless authorized?
        response['WWW-Authenticate'] = %(Basic realm="Testing HTTP Auth")
        throw(:halt, [401, "Not authorized\n"])
      end
    end

    def authorized?
      @auth ||=  Rack::Auth::Basic::Request.new(request.env)
      @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == ['facessook', ENV['PASSWORD']]
    end
  end

  get '*' do
    # redirect production version
    return redirect "http://facebook.com#{request.env['PATH_INFO']}", 302 if settings.environment == :production

    # protect staging app
    protected! if settings.environment == :staging

    # APP
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :protect_environments!

  protected
    def protect_environments!
      # redirect production version
      #return redirect_to "http://facebook.com#{request.env['PATH_INFO']}", status: 302 if Rails.env.production?

      # protect staging env
      if Rails.env.staging?
        authenticate_or_request_with_http_basic do |username, password|
          username == 'facessook' && password == ENV['PASSWORD']
        end
      end
    end
end

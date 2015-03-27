class UserSessionsController < ApplicationController

  def self.oauth_consumer
    @callback_url = "http://127.0.0.1:3000/oauth/callback"
    @consumer = OAuth::Consumer.new("key","secret", :site => "https://agree2")
    @request_token = @consumer.get_request_token(:oauth_callback => @callback_url)
    session[:request_token] = @request_token
    redirect_to @request_token.authorize_url(:oauth_callback => @callback_url)
    @access_token = @request_token.get_access_token
    @photos = @access_token.get('/photos.xml')
  end

    def self.oauth_consumer
      ::OAuth::Consumer.new("TOKEN", "SECRET",
      { :site => "http://twitter.com",
      :authorize_url => "http://twitter.com/oauth/authenticate"})
    end

end

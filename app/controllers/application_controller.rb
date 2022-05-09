class ApplicationController < ActionController::Base
  before_action :basic_auth

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # username == "test1207" && password == "1207"
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end

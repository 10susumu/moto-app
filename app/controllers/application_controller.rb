class ApplicationController < ActionController::Base
  before_action :configre_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  def configre_permitted_parameters
    added_attrs = [ :nickname, :avatar, :profile ]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs )
    devise_parameter_sanitizer.permit(:sign_in, keys: added_attrs )
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs )
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
     username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end

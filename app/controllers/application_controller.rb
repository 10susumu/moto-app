class ApplicationController < ActionController::Base
  before_action :configre_permitted_parameters, if: :devise_controller?

  def configre_permitted_parameters
    added_attrs = [ :nickname, :avatar, :profile ]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs )
    devise_parameter_sanitizer.permit(:sign_in, keys: added_attrs )
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs )
  end
end

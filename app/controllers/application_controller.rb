class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :role, :avatar, :profile, :user_age, :avatar_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address, :role, :avatar, :profile, :avatar_cache])
  end
end

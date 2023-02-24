class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def current_ability
    if user_signed_in?
      @current_ability ||= ::UserAbility.new(current_user)
    else
      @current_ability ||= ::Ability.new(nil)
    end
  end
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, notice: '権限がありません。'
  end

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :role, :avatar, :profile, :user_age, :avatar_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address, :role, :avatar, :profile, :avatar_cache])
  end

  private
  def invalid_foreign_key
    redirect_to admin_users_path, notice: 'このユーザーは削除できません。会話中のチャットが存在します。'
  end
end

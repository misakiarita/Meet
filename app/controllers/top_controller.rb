class TopController < ApplicationController
  def index
  end
  def guest_login
    user = User.guest
    sign_in user
    redirect_to pets_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  def admin_guest_login
    user = User.admin_guest
    sign_in user
    redirect_to pets_path, notice: '管理ゲストユーザーとしてログインしました。'
  end
end

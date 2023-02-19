class Admin::UsersController < ApplicationController
  before_action :admin_user?

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
 end

 def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = '削除しました'
      redirect_to admin_users_path
    else
      flash[:notice] = '削除できません'
      redirect_to admin_users_path
    end
  end
private

def admin_user?
   redirect_to pets_path unless current_user.admin?
end

end

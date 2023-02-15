class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def favorite_pet
    @user = User.find(params[:id])
    favorite = Favorite.where(user_id: current_user.id).pluck(:pet_id)
    @favorites = Pet.find(favorite)
  end

end

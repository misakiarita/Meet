class FeaturesController < ApplicationController
  # def new
  #   @pet = Pet.find(params[:pet_id])
  #   @feature = @pet.features.build
  # end

  def create
    @feature = Feature.new(feature_params)
    if @feature.save
      redirect_to pets_path   
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def feature_params
    params.require(:feature).permit(:dog_or_cat, :color, :weight, :pet_age, :note, :sex, :pet_id) 
     #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end

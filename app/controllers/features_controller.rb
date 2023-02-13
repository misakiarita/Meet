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

  def edit
   @pet = Pet.find(params[:id])
   @feature = Feature.find_by(pet_id: @pet.id)
  end

  def update

    @feature = Feature.find(params[:id])
    if @feature.update(feature_params)
      redirect_to pets_path, notice: "Your Feature was edited!"   
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  # def set_feature
  #   @features = features.pet.id
  # end

  def feature_params
    params.require(:feature).permit(:dog_or_cat, :color, :weight, :pet_age, :note, :sex, :pet_id) 
  end
end

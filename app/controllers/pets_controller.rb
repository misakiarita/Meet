class PetsController < ApplicationController
  before_action :set_pet, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create]
  authorize_resource
  # GET /pets or /pets.json
    def index
      @pets = Pet.all.includes(:petpics)
 
      if params[:pet].present?   
          user_age = params[:pet][:qualify_age]
          species = params[:pet][:dog_or_cat]
          address = params[:pet][:pet_address]
        if species.present? && user_age.present? && address.present?
          pets = Pet.age_species(user_age,species)
          @pets = pets.address_search(address)
        elsif species.present? && address.present?
          pets = Pet.species_search(species)
          @pets = pets.address_search(address)
        elsif user_age.present? && address.present?
          pets = Pet.below_age(user_age)
          @pets = pets.address_search(address)  
        elsif address.present?
          @pets = Pet.address_search(address)
        elsif species.present? && user_age.present?
          @pets = Pet.age_species(user_age,species)
        elsif species.present?
          @pets = Pet.species_search(species)
        elsif user_age.present?
          @pets = Pet.below_age(user_age)
        end    
      end
  
    end

  # GET /pets/1 or /pets/1.json
  def show
    @features = @pet.features
    @favorite = current_user.favorites.find_by(pet_id: @pet.id)
    @user = @pet.user
    @conversation = current_user.conversations.find_by(pet_id: @pet.id) 
  end

  # GET /pets/new
  def new
    @pet = Pet.new
    @pet.petpics.build
  end
  
  # GET /pets/1/edit
  def edit
    if @pet.user_id == current_user.id
      render :edit
    else
      redirect_to root_path
    end
  end

  
  # POST /pets or /pets.json
  def create
    @pet = Pet.new(pet_params)
    @pet = current_user.pets.build(pet_params)
    
    respond_to do |format|
      if @pet.save
        format.html { redirect_to pet_featurepost_path(@pet), notice: "Pet was successfully created." }
        # format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
      
    end
  end
  
  
  def featurepost
    @pet = Pet.find(params[:pet_id])
    @feature = @pet.features.build
  end
  
  # PATCH/PUT /pets/1 or /pets/1.json
  def update
    if @pet.user_id == current_user.id
      respond_to do |format|
        if @pet.update(pet_params)
          format.html { redirect_to pet_url(@pet), notice: "Pet was successfully updated." }
          format.json { render :show, status: :ok, location: @pet }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @pet.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /pets/1 or /pets/1.json
  def destroy
    @pet.destroy

    respond_to do |format|
      format.html { redirect_to pets_url, notice: "Pet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def pet_params
      params.require(:pet).permit(:pet_name, :pet_address, :qualify_age, :status, :price, 
      petpics_attributes: %i[id picture picture_cache])     
    end
end

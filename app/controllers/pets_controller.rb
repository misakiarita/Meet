class PetsController < ApplicationController
  before_action :set_pet, only: %i[ show edit update destroy ]

  # GET /pets or /pets.json
  def index
    @pets = Pet.all
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

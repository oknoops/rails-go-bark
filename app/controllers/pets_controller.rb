class PetsController < ApplicationController

  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = policy_scope(Pet).order(created_at: :desc)
  end

  def show
    @review = Review.new
    @contract = Contract.new
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
  @pet = Pet.new(pet_params)
  @pet.user = current_user
  authorize @pet
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def destroy
    @pet.destroy
     redirect_to pets_path
  end

  private

  def set_pet
     @pet = Pet.find(params[:id])
     authorize @pet
  end

  def pet_params
    params.require(:pet).permit(:name, :photo, :photo_cache, :description, :price, :specie, :breed)
  end
end

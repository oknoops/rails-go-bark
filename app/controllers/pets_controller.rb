class PetsController < ApplicationController

  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.all
  end

  def show
    @review = Review.new
  end

  def new
    @pet = Pet.new
  end

  def create
  @pet = Pet.new(pet_params)
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
  end

  def pet_params
    params.require(:pets).permit(:name, :photo, :description, :price, :species, :breed)
  end
end

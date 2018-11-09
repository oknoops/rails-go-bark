class PetsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present? && params[:specie].present?
      @pets = policy_scope(Pet).joins(:user).where("pets.specie like ? AND (pets.name @@ ? OR pets.description @@ ? OR users.name @@ ? OR pets.breed @@ ? OR users.last_name @@ ?)", params[:specie], params[:query], params[:query], params[:query], params[:query], params[:query]).sorted_by_average
    elsif params[:query].present?
      @pets = policy_scope(Pet).joins(:user).where("pets.name @@ ? OR pets.description @@ ? OR users.name @@ ? OR pets.breed @@ ? OR users.last_name @@ ?", params[:query], params[:query], params[:query], params[:query], params[:query]).sorted_by_average
    elsif params[:specie].present?
      @pets = policy_scope(Pet).joins(:user).where("pets.specie ilike ?", params[:specie]).sorted_by_average
    else
      @pets = policy_scope(Pet).sorted_by_average
    end
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

  def search
    sql_query = " \
      pets.name @@ :query \
      OR pets.description @@ :query \
      OR users.name @@ :query \
      OR pets.breed @@ :query \
      OR users.last_name @@ :query \
    "
    @pets = Pet.joins(:user).where(sql_query, query: "%#{params[:tag]}%")
    authorize @pets
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

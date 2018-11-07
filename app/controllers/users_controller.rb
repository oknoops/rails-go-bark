class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    total = []
    pets = @user.pets.each do |pet|
      pet.reviews.each do |review|
        total << review.rating
      end
    end
    if total.size == 0
      @average = 0
    else
      @average = total.sum / total.size
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
    authorize @user
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:name, :avatar, :last_name, :avatar_cache)
  end
end

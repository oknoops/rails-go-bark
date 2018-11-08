class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = policy_scope(User).order(created_at: :desc)
  end

  def show
    @average = average(@user)
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

  def average(user)
    total = []
    pets = user.pets.each do |pet|
      pet.reviews.each do |review|
        total << review.rating
      end
    end
    if total.size == 0
      return average = 0
    else
      return average = total.sum / total.size
    end
  end

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:name, :admin, :avatar, :last_name, :avatar_cache, :phone_number, :address)
  end
end

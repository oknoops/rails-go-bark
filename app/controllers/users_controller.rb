class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    @user.destroy
     redirect_to users_path
  end

  private

  def set_user
     @user = User.find(params[:id])
  end

#   def user_params
#     params.require(:users).permit(:name, :photo, :last_name,  :species, :breed)
# end
end

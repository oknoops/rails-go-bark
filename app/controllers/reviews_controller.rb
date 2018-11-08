class ReviewsController < ApplicationController
  before_action :set_review_and_pet, only: [:edit, :update, :destroy]

  def create
    @review = Review.new(review_params)
    @review.pet = Pet.find(params[:pet_id])
    @review.user = current_user
    @review.save
    redirect_to pet_path(@review.pet)
    authorize @review
  end

  def edit
    authorize @review
  end

  def update
    if @review.update(review_params)
      redirect_to pet_path(@review.pet)
    else
      render :edit
    end
    authorize @review
  end

  def destroy
    @review.destroy
    redirect_to pet_path(@pet)
    authorize @review
  end

  private

  def set_review_and_pet
    @pet    = Pet.find(params[:pet_id])
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end

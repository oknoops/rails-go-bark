class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.pet = Pet.find(params[:pet_id])
    @review.user = current_user
    @review.save
    redirect_to pet_path(@review.pet)
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end

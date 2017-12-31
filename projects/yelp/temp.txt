class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def new
  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to @review
  end


  private

  def review_params
    params.require(:review).permit(:author, :email, :rating, :comments)
  end

end

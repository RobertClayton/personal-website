class ReviewsController < ApplicationController
  # before_action :authenticate_user!

  def show
    @review = Review.find(params[:id])
  end

  def new
    check_user_is_signed_in
  end

  def create
    check_user_is_signed_in
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(review_params)
    redirect_to restaurant_path(@restaurant)

  end

  private

  def review_params
    params.require(:review).permit(:author, :email, :rating, :comments, :user_id)
  end

  def check_user_is_signed_in
    redirect_to '/users/sign_in' unless user_signed_in?
  end
end

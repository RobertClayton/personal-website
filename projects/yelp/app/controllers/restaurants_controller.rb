class RestaurantsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @restaurant = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    set_average_rating
    check_user_left_review
    check_user_is_owner
  end

  def new
    check_user_is_signed_in
    @restaurant = Restaurant.new
  end

  def edit
    check_user_is_signed_in
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    check_user_is_signed_in
    @restaurant = Restaurant.new(restaurant_params)
    check_validations_new
    # uploader = ImageUploader.new
    # uploader.store!(my_file)
    # uploader.retrieve_from_store!('my_file.png')
  end

  def update
    check_user_is_signed_in
    @restaurant = Restaurant.find(params[:id])
    check_validations_edit
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :location, :min_price, :max_price, :description, :category, :user_id, :image)
  end

  def check_user_is_signed_in
    redirect_to '/users/sign_in' unless user_signed_in?
  end

  def check_user_left_review
    @user_left_review = false
    @restaurant.reviews.each do |review|
      @user_left_review = true  if review.user.id == current_user.id
    end
  end

  def set_average_rating
    @ratings = 0
    @restaurant.reviews.each { |review| @ratings += review.rating }
    (@ratings /= @restaurant.reviews.length.to_f) if @ratings != 0
  end

  def check_validations_edit
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def check_validations_new
    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def check_user_is_owner
    @user_is_owner = false
    @user_is_owner = true if @restaurant.user_id == current_user.id
  end
end

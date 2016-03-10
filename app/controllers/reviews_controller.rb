class ReviewsController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @review = @product.reviews.all

  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)

    if @review.save
      redirect_to action: 'index'

    else
      redirect_to user_product_path(current_user, @product)
    end

  end

  private

  def review_params
    params.require(:review).permit(:description)
  end
end

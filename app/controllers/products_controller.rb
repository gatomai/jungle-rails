class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)

  end

  def show
    @product = Product.find params[:id]
    @review = Review.new

    @sort_reviews = Review.all.where(product_id: params[:id]).joins(:user).order(created_at: :desc)
  end

  def new_review
    @review = Review.new(review_params)
  end

end

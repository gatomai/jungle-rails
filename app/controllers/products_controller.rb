class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)

  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
  end

  def new_review
    @review = Review.new(review_params)
  end

end

class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV['AUTH_USERNAME'].to_s, password: ENV['AUTH_PASSWORD'].to_s

  def index
    @categories = Category.order(id: :desc).all
    end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to %i[admin categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to %i[admin category], notice: 'Category deleted!'
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end

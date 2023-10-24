class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ability

  def set_ability
    @ability = Ability.new(current_user)
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  private

  def category_params
    params.permit(:name, :icon)
  end
end

class CategoriesController < ApplicationController
  def index
    @author = current_user
    @categories = Category.all
    @category_sums = {}
    @categories.each do |category|
      @category_sums[category.id] = category.purchases.sum(:amount)
    end
  end

  def new
    @category = Category.new
  end

  def create
    @author = current_user
    @category = @author.categories.build(author_id: current_user.id, **category_params)
    if @category.save
      flash[:success] = 'Successfully added your category!.'
      redirect_to categories_path(@author)
    else
      flash[:error] = 'There was an error while creating the category.'
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end

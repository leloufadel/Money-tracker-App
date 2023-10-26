class PurchasesController < ApplicationController
  before_action :find_category, only: %i[new create show]

  def index
    @category = Category.find_by(id: params[:category_id])
    @category_name = @category.name
    @purchases = @category.purchases.order(created_at: :desc)
    @sum = @purchases.sum(:amount)
  end

  def new
    @purchase = Purchase.new
    @categories = Category.all
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.author_id = current_user.id

    existing_purchase = @category.purchases.find_by(name: @purchase.name, amount: @purchase.amount)

    if existing_purchase
      flash[:error] = 'A similar purchase already exists for this category.'
      redirect_to category_purchases_path(category_id: @category.id)
      return
    end

    if @purchase.save
      CategoryPurchase.create(purchase: @purchase, category_id: @category.id)

      flash[:success] = 'Successfully captured payment.'
      redirect_to category_purchases_path(category_id: @category.id)
    else
      flash[:error] = 'There was an error while capturing the payment.'
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:name, :amount)
  end

  def find_category
    @category = Category.find_by(id: params[:category_id])
  end
end

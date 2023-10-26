class PurchasesController < ApplicationController
  before_action :find_category, only: %i[new create show]

  # def index
  #   @purchase = Purchase.all
  #   @categories = Category.all
  # end

  def index
    # @category_id = params[:id]
    @category = Category.find_by(id: params[:category_id])
    @category_name = @category.name
    @purchases = @category.purchases.order(created_at: :desc)
    # @purchases = Purchase.where(id: @category_purchases.pluck(:purchase_id)).order(created_at: :desc)
    @sum = @purchases.sum(:amount)
  end

  def new
    @purchase = Purchase.new
    @categories = Category.all
  end

  def create
    @purchase = Purchase.new(author_id: current_user.id, **purchase_params)
    category_ids = Array(params[:purchase][:category_ids]).reject(&:empty?)

    @purchase.user_id = current_user.id
    if @purchase.save
      # category_ids.each do |category_id|
      CategoryPurchase.create(purchase: @purchase, category_id: category_ids.first)
      # end
      my_category = category_ids.first
      flash[:success] = 'Successfully captured payment.'
      # redirect_to category_purchases_url(author_id: current_user.id, id: my_category)
      redirect_to category_purchases_url(category_id: my_category)

    else
      flash[:error] = 'There was an error while capturing the payment.'
      render :new
    end
  end

  # def destroy
  #   return unless @purchase.destroy

  #   redirect_to purshases_url
  # end

  private

  def purchase_params
    # params.require(:purchase).permit(:name, :amount, category_ids: [])
    params.require(:purchase).permit(:name, :amount, :author_id, category_ids: [])
  end

  def find_category
    @category = Category.find_by(id: params[:category_id])
  end
end

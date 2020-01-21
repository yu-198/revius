class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_is_deleted

  def index
      @user = User.find(current_user.id)
      @order = Order.where(user_id: @user.id)
  end

  def create
      @order = Order.new(order_params)
      @order.user_id = current_user.id
      product = Product.find(params[:order][:product_id])

      if (product.stock - @order.quantity) < 0
        product.is_stopped = true
        product.save
        render :show
      end

      @order.price = product.tax_include_price
    if @order.save
      product.stock  -= @order.quantity
      product.is_stopped = true
      product.save
      redirect_to finish_orders_path
    else
      render :edit
    end
  end

  def show
  end

  def new
  end

  def finish
  end

  private
  	def order_params
  		params.require(:order).permit(:quantity, :product_id)
  	end
    def user_is_deleted
      if user_signed_in? && current_user.is_deleted?
         redirect_to root_path
      end
    end
end

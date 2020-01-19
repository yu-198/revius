class OrdersController < ApplicationController
  def index
      @user = User.find(current_user.id)
      @order = Order.where(user_id: @user.id)
  end

  def create
      @order = Order.new(order_params)
      @order.user_id = current_user.id
      @order.price = Product.find(params[:order][:product_id]).tax_include_price
    if@order.save
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
end

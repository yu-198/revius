class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_is_deleted

  PER = 12

  def index
      @user = User.find(current_user.id)
      @order = Order.where(user_id: @user.id)
      @order = Order.page(params[:page]).per(PER)
  end

  def show
      @order = Order.find(params[:id])
  end

  def create
      @order = Order.new(order_params)
      @order.user_id = current_user.id
      product = Product.find(params[:order][:product_id])

      if (product.stock - @order.quantity) < 0
         product.is_stopped = true
         product.save
         flash[:danger] = "この商品の在庫がなくなりました"
         render :show
      end
      @order.price = product.tax_include_price
    if @order.save
       product.stock  -= @order.quantity
      if product.stock == 0
         product.is_stopped = true
         product.save
         flash[:danger] = "この商品の在庫がなくなりました"
      end
         redirect_to finish_orders_path
    else
         render :edit
    end
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

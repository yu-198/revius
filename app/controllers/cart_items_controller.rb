class CartItemsController < ApplicationController
  def index
  	@cart_items = current_user.cart_items
  	@total_price = @cart_items.sum(:price)
  end

  def create
    @cart_item = CartItem.new(item_params)
    @cart_item.user_id = current_user.id
    @cart_item.price = @cart_item.product.price * @cart_item.quantity
    @cart_item.save
    redirect_to cart_items_path
  end

  def destroy
  	@cart_item = CartItem.find(params[:id])
  	@cart_item.destroy
  	redirect_to cart_items_path
  end

  def destroy_all
  	@cart_items = current_user.cart_items
  	@cart_items.destroy_all
  	redirect_to cart_items_path
  end

  def update_all
  	@items = current_user.cart_items
  	@items.each do |item|
  		item.price = item.quantity * item.product.price
  		item.save
  	end
  	redirect_to cart_items_path
  end

  private
  	def item_params
  		params.require(:cart_item).permit(:user_id, :product_id, :quantity, :price)
  	end
end

class CartItemsController < ApplicationController
	before_action :authenticate_user!
	before_action :user_is_deleted
  def index
  	@cart_items = current_user.cart_items
  	@total_price = @cart_items.sum(:price)
  end

  def create
    @cart_item = CartItem.new(item_params)
    @cart_item.user_id = current_user.id
    @cart_item.price = @cart_item.product.price * @cart_item.quantity.to_i
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
      item.quantity = item_params[:quantity][item.id.to_s]
  		item.price = item.quantity * item.product.price
  		item.save
  	end
  	redirect_to cart_items_path
  end

  private
  	def item_params
  		params.permit(:user_id, :product_id, :quantity, :price)
  	end
	def user_is_deleted
      if user_signed_in? && current_user.is_deleted?
         redirect_to root_path
      end
    end
end

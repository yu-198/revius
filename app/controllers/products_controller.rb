class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  before_action :user_is_deleted, except: [:index]

  PER = 8

  def index
    if params["genre"]
      @products = Product.where(genre_id: params["genre"])
    else
      byebug
      @products = Product.page(params[:page]).per(PER)
    end
      @genres = Genre.active
  end

  def show
  	@product = Product.find(params[:id])
	  @order = Order.new(product_id: @product.id)
  end

  private
  def user_is_deleted
    if current_user.is_deleted?
      redirect_to root_path
    end
  end
end

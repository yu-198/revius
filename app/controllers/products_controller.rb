class ProductsController < ApplicationController
  before_action :user_is_deleted, except: [:index]

  PER = 15

  def index
    @genres = Genre.active
    @products = Product.page(params[:page]).per(PER)
    @products = @products.where(genre_id: params["genre"]) if params["genre"]
    @articles = Article.all
  end

  def show
  	@product = Product.find(params[:id])
	  @order = Order.new(product_id: @product.id)
  end

  private
  def user_is_deleted
    if user_signed_in? && current_user.is_deleted?
      redirect_to root_path
    end
  end

end

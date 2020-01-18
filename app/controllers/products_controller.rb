class ProductsController < ApplicationController
  def index
    if params["genre"]
      @products = Product.active.where(genre_id: params["genre"])
    else
			@products = Product.active
    end
      @genres = Genre.active
  end

  def show
  	@product = Product.find(params[:id])
	  @order = Order.new(product_id: @product.id)
  end
end

class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
       redirect_to admins_products_path
    else
       render :new
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
       redirect_to admins_products_path
    else
       render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :introduction, :price, :genre_id, :is_stopped, :stock)
  end
end

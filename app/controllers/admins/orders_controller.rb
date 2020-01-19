class Admins::OrdersController < ApplicationController
  def index
  	@order = Order.created_today
  end

  def update
  end

  def show
  end
end

class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!

	PER = 23

	def index
		@order = Order.all
		@order = Order.page(params[:page]).per(PER).order('updated_at DESC')
	end

	def show
		@order = Order.find(params[:id])
	end
end

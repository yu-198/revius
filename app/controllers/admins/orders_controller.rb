class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@order = Order.all
	end

	def update
	end

	def show
	end
end

class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@order = Order.all
	end
end

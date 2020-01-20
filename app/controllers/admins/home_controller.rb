class Admins::HomeController < ApplicationController
	def top
		@order = Order.created_today
	end
end

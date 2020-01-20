module Admins::OrdersHelper
	def total_price(order)
    total_fee = (order.price * order.quantity + order.postage).round
  end
end

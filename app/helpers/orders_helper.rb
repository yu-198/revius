module OrdersHelper
  def addTax(price)
    tax_in_price = (price * 1.1).round
  end

  def total_price(order)
    total_fee = (order.price * order.quantity + order.postage).round
  end

  def serch_product(order)
  	@product = Product.find order.product_id
  end
end
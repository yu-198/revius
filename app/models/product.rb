class Product < ApplicationRecord
	belongs_to :genre
	belongs_to :order, optional: true
	attachment :image
	scope :active, -> {where(is_stopped: false)}


	# 擬似的にorderに擬似的にカラムを作っている(product_priceの値を税有りの金額で入れるため)
	def tax_include_price
		(price * 1.1).round
	end
end

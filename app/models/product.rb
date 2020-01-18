class Product < ApplicationRecord
	has_many :cart_items
	belongs_to :genre
	attachment :image
	scope :active, -> {where(is_stopped: false)}

	def tax_include_price
		(price * 1.1).round
	end
end

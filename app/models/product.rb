class Product < ApplicationRecord
	belongs_to :genre
	has_many :orders
	# belongs_to :article
	attachment :image

	validates :introduction, presence: true, length: { maximum: 100 }
	validates :name, presence: true
	# 擬似的にorderに擬似的にカラムを作っている(product_priceの値を税有りの金額で入れるため)
	def tax_include_price
		(price * 1.1).round
	end
end

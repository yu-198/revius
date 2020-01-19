class Order < ApplicationRecord
	belongs_to :user
	has_one :product
	enum payment:{ クレジットカード: 1,コンビニ払い:2 }
	enum delivery_status:{ 配送待ち: 1, 配送済み:2 }
end

class Order < ApplicationRecord
	belongs_to :user
	belongs_to :product
	enum payment:{ クレジットカード: 1,コンビニ払い:2 }
	enum delivery_status:{ 入金待ち:1, 配送待ち: 2, 配送済み: 3}
	# scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
end

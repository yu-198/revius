class OrderedItem < ApplicationRecord
	belongs_to :product
	belongs_to :order
	scope :created_today, -> { where(created_at: Time.zone.now.all_day).select(:product_id).distinct }
end

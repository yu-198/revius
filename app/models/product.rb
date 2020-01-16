class Product < ApplicationRecord
	has_many :cart_items
	has_many :ordered_items
	has_many :orders, through: :ordered_items
	belongs_to :genre
	attachment :image
	scope :active, -> {where(is_stopped: false)}
end

class Order < ApplicationRecord
	has_many :ordered_items, dependent: :destroy
	has_many :products, through: :ordered_items
end

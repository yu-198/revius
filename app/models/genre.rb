class Genre < ApplicationRecord
	has_many :products
	scope :active, ->{where(is_disable: false)}
	validates :name, presence: true
end

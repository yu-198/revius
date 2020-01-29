class Article < ApplicationRecord
	# belongs_to :product
	validates :name, presence: true
	validates :introduction, presence: true
end

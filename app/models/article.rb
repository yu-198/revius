class Article < ApplicationRecord
	has_many :products
	validates :name, presence: true
	validates :introduction, presence: true
end

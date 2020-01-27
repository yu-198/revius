class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy

  VALID_EMAIL_REGEX = /\A\d{10,11}\z/
  validates :phone,presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :last_name, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :first_name, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :postal_code, format: /\A[0-9]+\z/
end

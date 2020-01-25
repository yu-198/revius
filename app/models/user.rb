class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy

  VALID_EMAIL_REGEX = /\A\d{10,11}\z/
  validates :phone,presence: true, format: {with: VALID_EMAIL_REGEX}

end

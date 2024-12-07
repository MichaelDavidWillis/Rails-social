class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_one_attached :image

  validates :first_name, presence: true
  validates :second_name, presence: true
  validates :email, presence: true, length: { minimum: 6 }, format: { with: URI::MailTo::EMAIL_REGEXP }
end

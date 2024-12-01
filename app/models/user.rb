class User < ApplicationRecord
  has_many :posts

  validates :first_name, presence: true
  validates :second_name, presence: true
  validates :email, presence: true, length: { minimum: 6 }
end

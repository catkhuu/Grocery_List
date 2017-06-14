class User < ApplicationRecord
  has_secure_password
  has_many :shopping_lists, dependent: :destroy
  has_many :test_recipes, through: :shopping_lists

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, uniqueness: true, presence: true
  validates :username, length: { minimum: 6, maximum: 20 }, presence: true
  validates :position, presence: true
  validates :password, length: { minimum: 8, maximum: 20 }
end

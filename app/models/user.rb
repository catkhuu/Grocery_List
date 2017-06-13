class User < ApplicationRecord
  has_secure_password
  has_many :shopping_lists, dependent: :destroy
  has_many :test_recipes, through: :shopping_lists
end

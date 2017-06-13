class ShoppingList < ApplicationRecord
  belongs_to :user
  has_many :shopping_list_test_recipes, dependent: :destroy
  has_many :test_recipes, through: :shopping_list_test_recipes
end

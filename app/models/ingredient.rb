class Ingredient < ApplicationRecord
  has_many :ingredient_amounts, dependent: :destroy
  has_many :test_recipes, through: :ingredient_amounts
  has_many :specialty_purchase_destinations, dependent: :destroy
end

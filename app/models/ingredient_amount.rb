class IngredientAmount < ApplicationRecord
  belongs_to :test_recipe
  belongs_to :ingredient

  validates :units, :ingredient_amount, :test_recipe_id, :ingredient_id, presence: true
end

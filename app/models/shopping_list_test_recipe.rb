class ShoppingListTestRecipe < ApplicationRecord
  belongs_to :shopping_list
  belongs_to :test_recipe

  validates :shopping_list_id, :test_recipe_id, presence: true
end

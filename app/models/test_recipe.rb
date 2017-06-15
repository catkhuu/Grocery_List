class TestRecipe < ApplicationRecord
  has_many :shopping_list_test_recipes, dependent: :destroy
  has_many :shopping_lists, through: :shopping_list_test_recipes
  has_many :ingredient_amounts, dependent: :destroy
  has_many :ingredients, through: :ingredient_amounts

  validates :title, presence: true

  def display_measurements
    self.ingredient_amounts.reduce({}) do |h, measurement|
      h.merge(measurement.id => "#{measurement.amount} #{measurement.units} #{measurement.ingredient.name}")
    end
  end

end

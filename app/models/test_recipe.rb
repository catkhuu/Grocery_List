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

  def get_ingredient_names(store)
    self.ingredients.map { |ingredient| store[ingredient.name] = [0] }
  end

  def sort_ingredients(store)
    self.ingredient_amounts.each do |process|
      if store[process.ingredient.name]
        store[process.ingredient.name][0] += process.amount
        store[process.ingredient.name][1] = process.units unless store[process.ingredient.name].length > 1
      end
    end
  end
end

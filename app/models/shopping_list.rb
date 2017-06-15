class ShoppingList < ApplicationRecord
  belongs_to :user
  has_many :shopping_list_test_recipes, dependent: :destroy
  has_many :test_recipes, through: :shopping_list_test_recipes

  validates :title, :shopping_date, :user_id, presence: true

  def display_shopping_date
    self.shopping_date.strftime('%m/%d/%Y')
  end
  
end

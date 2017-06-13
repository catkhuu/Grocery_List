class RenameShoppingListsTestRecipesTable < ActiveRecord::Migration[5.1]
  def change
    rename_table('shopping_lists_test_recipes', 'shopping_list_test_recipes')
  end
end

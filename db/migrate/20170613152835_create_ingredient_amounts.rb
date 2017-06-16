class CreateIngredientAmounts < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredient_amounts do |t|
      t.integer :amount, null: false
      t.string  :units, null: false
      t.references :test_recipe, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true
      t.timestamps null: false
    end

    add_index :ingredient_amounts, [:test_recipe_id, :ingredient_id], unique: true 
  end
end

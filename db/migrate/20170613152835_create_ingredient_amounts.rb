class CreateIngredientAmounts < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredient_amounts do |t|
      t.integer :amount, null: false
      t.string  :units, null: false
      t.references :test_recipe, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end

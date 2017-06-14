class ShoppingListTestRecipesController < ApplicationController
  def new
    @shopping_list = ShoppingList.find_by(id: params[:shopping_list_id])
    @shopping_list_test_recipe = ShoppingListTestRecipe.new
  end

  def create
    shopping_list_test_recipe = ShoppingListTestRecipe.new(shopping_list_test_recipe_params)
    if shopping_list_test_recipe.save
      redirect_to user_shopping_list_path(current_user, params[:shopping_list_id])
    else
      @errors = shopping_list_test_recipe.errors.full_messages
      'new'
    end
  end

  def destroy
    shopping_list_test_recipe = ShoppingListTestRecipe.where(shopping_list_id: params[:shopping_list_id], test_recipe_id: params[:test_recipe_id])
    if shopping_list_test_recipe.destroy
      redirect_to user_shopping_list_path(current_user, params[:shopping_list_id])
    else
      @errors = ['Sorry, unable to process your request.']
      render 'shopping_lists/show'
    end
  end

  private

  def shopping_list_test_recipe_params
    params.require(:shopping_list_test_recipe).permit(:shopping_list_id, :test_recipe_id)
  end
end

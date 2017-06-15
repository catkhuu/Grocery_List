class IngredientAmountsController < ApplicationController
  def new
    @units = ['Bunch', 'Tbsp', 'Tsp', 'Each', 'Grams']
    @test_recipe = TestRecipe.find_by(id: params[:test_recipe_id])
    @ingredients = Ingredient.all.order(name: :asc)
    @ingredient_amount = IngredientAmount.new
  end

  def create
    measurement = IngredientAmount.new(ingredient_amount_params)
    if measurement.save
      redirect_to test_recipe_path(@test_recipe)
    else
      @errors = ingredient_amount.errors.full_messages
      render 'new'
    end
  end

  def edit
    @ingredient_amount = IngredientAmount.find_by(id: params[:id])
    @test_recipe = @ingredient_amount.test_recipe
    @ingredients = Ingredient.all.order(name: :asc)
  end

  def update
    @ingredient_amount = IngredientAmount.find_by(id: params[:id])
    if @ingredient_amount.update(ingredient_amount_params)
      redirect_to test_recipe_path(@ingredient_amount.test_recipe)
    else
      @errors = @ingredient_amount.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @ingredient_amount = IngredientAmount.find_by(id: params[:id])
    @test_recipe = @ingredient_amount.test_recipe # in case of  failure to delete
    @debuted_lists = @test_recipe.shopping_lists.order(shopping_date: :asc)
    if @ingredient_amount.destroy
      redirect_to test_recipe_path(@test_recipe) ## @ingredient_amount may or may not be null
      # in which case, create variable test_recipe = @ingredient_amount.test_recipe before destroy
    else
      @errors = ['Sorry, unable to process your request.']
      render 'test_recipes/show'
    end
  end

  private

  def ingredient_amount_params
    params.require(:ingredient_amount).permit(:amount, :units, :test_recipe_id, :ingredient_id)
  end
end

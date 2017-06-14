class TestRecipesController < ApplicationController
  before_action :set_shopping_list, :initialize_new_test_recipe, only: [:new, :create]
  before_action :find_and_ensure_test_recipe, except: [:index, :new, :create]

  def index
    @test_recipes = TestRecipe.all
  end

  def new
  end

  def create
    test_recipe = TestRecipe.new(test_recipe_params)
    if test_recipe.save
      if test_recipe.shopping_list_test_recipes.create!(shopping_list_id: params[:shopping_list_id])
        redirect_to user_shopping_list_path(current_user, params[:shopping_list_id])
      end
    else
      @errors = test_recipe.errors.full_messages
      render 'new'
    end
  end

  def show
    # This recipe has been tried and tested in these lists...
    @debuted_lists = @test_recipe.shopping_lists.order(shopping_date: :asc)
  end

  def edit
  end

  def update
    if @test_recipe.update(test_recipe_params)
      redirect_to test_recipe_path(@test_recipe)
    else
      @errors = @test_recipe.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    if @test_recipe.destroy
      redirect_to test_recipes_path
    else
      @errors = ['Sorry, unable to process your request.']
      render 'show'  # or maybe index??
    end
  end

  private

  def test_recipe_params
    params.require(:test_recipe).permit(:title)
  end

  def initialize_new_test_recipe
    @test_recipe = TestRecipe.new
  end

  def set_shopping_list
    render 'application/error404' unless @shopping_list = ShoppingList.find_by(id: params[:shopping_list_id])
  end

  def find_and_ensure_test_recipe
    @test_recipe = TestRecipe.find_by(id: params[:id])
  end
end

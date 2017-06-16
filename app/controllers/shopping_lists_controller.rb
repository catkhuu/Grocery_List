class ShoppingListsController < ApplicationController
  before_action :find_and_ensure_shopping_list, except: [:index, :new, :create]
  before_action :initialize_new_shopping_list, only: [:new, :create]

  def index
    @shopping_lists = current_user.shopping_lists
  end

  def new
  end

  def create
    shopping_list = current_user.shopping_lists.new(shopping_list_params)
    if shopping_list.save
      redirect_to user_shopping_list_path(current_user, shopping_list)
    else
      @errors = shopping_list.errors.full_messages
       render 'new'
    end
  end

  def show
    binding.pry
    @test_recipes = @shopping_list.test_recipes
    @ingredients = {}
    @test_recipes.each do |recipe|
      recipe.get_ingredient_names(@ingredients)
    end
    @test_recipes.each do |recipe|
      recipe.sort_ingredients(@ingredients)
    end
    @test_recipes
  end

  def edit
  end

  def update
    if @shopping_list.update(shopping_list_params)
      redirect_to shopping_list_path(@shopping_list)
    else
      @errors = @shopping_list.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    if @shopping_list.destroy
      redirect_to shopping_list_index   ## correct this
    else
      @errors = ['Unable to process your request. Please try again.']
      render 'show' ## OR maybe render 'edit'??
    end
  end

  private

  def shopping_list_params
    params.require(:shopping_list).permit(:title, :shopping_date, :user_id)
  end

  def find_and_ensure_shopping_list
    render 'application/error404' unless @shopping_list = ShoppingList.find_by(id: params[:id])
  end

  def initialize_new_shopping_list
    @shopping_list = ShoppingList.new
  end
end

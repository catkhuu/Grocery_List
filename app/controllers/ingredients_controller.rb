class IngredientsController < ApplicationController
  before_action :find_and_ensure_ingredient, except: [:index, :new, :create]
  def index
    @ingredients = Ingredient.all.order(name: :asc)
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    ingredient = Ingredient.new(ingredient_params)
    if ingredient.save
      redirect_to ingredient_path(ingredient)
    else
      @errors = ingredient.errors.full_messages
      render 'new'
    end
  end

  def show
    # @ingredient = Ingredient.find_by(id: params[id])

    # this ingredient appears in x number of recipes
    @test_recipes = @ingredient.test_recipes
    @recipe_count = @test_recipes.count
  end

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to ingredient_path(@ingredient)
    else
      @errors = @ingredient.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    if @ingredient.destroy
      redirect_to ingredients_path
    else
      @errors = ['Sorry, unable to process your request.']
      render 'show' # or index?? Where can users delete an ingredient? show or index only??
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :is_specialty)
  end

  def find_and_ensure_ingredient
    render 'application/error404' unless @ingredient = Ingredient.find_by(id: params[:id])
  end
end

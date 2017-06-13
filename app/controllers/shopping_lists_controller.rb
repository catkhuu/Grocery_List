class ShoppingListsController < ApplicationController
  before_action :find_and_ensure_shopping_list, except: [:index, :new, :create]

  def index
    @shopping_lists = current_user.shopping_lists
  end

  def new
    @shopping_list = ShoppingList.new
  end

  def create
    shopping_list = ShoppingList.new(shopping_list_params)
    if shopping_list.save
      redirect_to shopping_list_path(shopping_list)  ## doublecheck after config routes
    else
      @errors = shopping_list.errors
       render 'new'
    end
  end

  def show
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
end

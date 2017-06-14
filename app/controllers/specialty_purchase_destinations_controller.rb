class SpecialtyPurchaseDestinationsController < ApplicationController
  def new
    @ingredient = Ingredient.find_by(id: params[:ingredient_id])
    @specialty_purchase_destination = SpecialtyPurchaseDestination.new
  end

  def create
    @ingredient = Ingredient.find_by(id: params[:ingredient_id])
    specialty_purchase_destination = @ingredient.specialty_purchase_destinations.new(specialty_purchase_destination_params)
    if specialty_purchase_destination.save
      redirect_to specialty_purchase_destination_path(specialty_purchase_destination)
    else
      @errors = specialty_purchase_destination.errors.full_messages
      render 'new'
    end
  end

  def show
    @specialty_purchase_destination = SpecialtyPurchaseDestination.find_by(id: params[:id])
    @ingredient = @specialty_purchase_destination.ingredient
  end

  def edit
    @specialty_purchase_destination = SpecialtyPurchaseDestination.find_by(id: params[:id])
  end

  def update
    @specialty_purchase_destination = SpecialtyPurchaseDestination.find_by(id: params[:id])
    if @specialty_purchase_destination.update(specialty_purchase_destination_params)
      redirect_to specialty_purchase_destination_path(@specialty_purchase_destination)
    else
      @errors = @specialty_purchase_destination.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @specialty_purchase_destination = SpecialtyPurchaseDestination.find_by(id: params[:id])
    ingredient = @specialty_purchase_destination.ingredient
    if @specialty_purchase_destination.destroy
      redirect_to ingredient_path(ingredient)
    else
      @errors = ['Sorry, unable to process your request.']
      render 'show' # or render edit??? Where can user delete specialty purchase destination??  
    end
  end

  private

  def specialty_purchase_destination_params
    params.require(:specialty_purchase_destination).permit(:company_name, :website, :address, :ingredient_id)
  end
end

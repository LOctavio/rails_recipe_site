class IngredientsController < ApplicationController
  def index; end

  def new
    @foods = Food.all
  end

  def create
    @recipe_id = received_params[:recipe_id]
    @new_ingredient = Ingredient.create(received_params)
    if @new_ingredient.save
      redirect_to recipe_path(id: @recipe_id)
    else
      flash[:notice] = "Ingredient Not saved, please try again #{@recipe_id} "
      redirect_to new_ingredient_path(recipe_id: @recipe_id)
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
    @food = Food.find(@ingredient.food_id)
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(quantity: received_params_to_update[:quantity].to_i)
      flash[:notice] = 'Successfully updated '
      redirect_to recipe_path(@ingredient.recipe_id)
    else
      flash[:notice] = 'not saved'
      redirect_to edit_ingredient_path(@ingredient.id)
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.delete
      flash[:notice] = 'Successfully deleted'
      redirect_to recipe_path(@ingredient.recipe_id)
    else
      flash[:notice] = 'unable to delete'
      redirect_to recipe_path(@ingredient.id)
    end
  end

  private

  def received_params
    params.require(:ingredient).permit(:quantity, :food_id, :recipe_id)
  end

  def received_params_to_update
    params.require(:ingredient).permit(:quantity)
  end
end

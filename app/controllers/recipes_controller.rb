class RecipesController < ApplicationController
  def index
    user = curren_user
    @recipes = user.recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @published = @recipe[:public] == true ? 'checked' : ''
    @food_array = @recipe.show_foods(@recipe.id)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @user = curren_user
    @post = @user.recipe.create(recipe_params)
    redirect_to recipes_path
  end

  def destroy
    Recipe.find(params[:id]).destroy
    redirect_to recipes_path
  end

  def public_recipes
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end

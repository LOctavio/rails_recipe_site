class IngredientsController < ApplicationController
  def index; end

  def new
    # recipe_id = params[:recipe_id]
    @foods = Food.all
  end

  def create; end
end

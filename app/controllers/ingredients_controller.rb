class IngredientsController < ApplicationController
    def index   
    end
    def new
      @foods = Food.all 
    end
    def create
      @recipe_id = received_params[:recipe_id]
      @new_ingredient = Ingredient.create(received_params)
      if @new_ingredient.save
        redirect_to recipe_path(:id => @recipe_id)
      else
        flash[:notice] = "Ingredient Not saved, please try again #{@recipe_id} "
        redirect_to new_ingredient_path(:recipe_id => @recipe_id) 
      end

    end
    private

  def received_params
    params.require(:ingredient).permit(:quantity,:food_id,:recipe_id)
  end
end

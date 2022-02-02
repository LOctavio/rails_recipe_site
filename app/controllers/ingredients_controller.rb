class IngredientsController < ApplicationController
    def index   
    end
    def new
      @foods = Food.all 
    end
    def create
      @recipe_id = params[:recipe_id]
      received_values = post_params
      received_values.merge!(recipe_id:@recipe_id)
      @new_ingredient = Ingredient.create(received_values)
      if @new_ingredient.save
        redirect_to recipe_path(:id => @recipe_id)
      else
        flash[:notice] = 'Ingredient Not saved, please try again '
        redirect_to new_ingredient_path(:recipe_id => @recipe_id) 
      end

    end
    private

  def post_params
    params.require(:ingredient).permit(:quantity,:food_id)
  end
end

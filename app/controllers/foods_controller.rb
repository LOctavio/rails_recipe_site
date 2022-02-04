class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show; end

  def new; end

  def create
    @user = current_user
    params_to_save = post_params
    @new_food = @user.food.create(params_to_save)
    if @new_food.save
      redirect_to foods_path
    else
      flash[:notice] = 'Food Not saved, please try again '
      redirect_to new_food_path
    end
  end

  private

  def post_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end

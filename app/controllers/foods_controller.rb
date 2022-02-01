class FoodsController < ApplicationController
  def index 
    @foods = Food.all
  end

  def show; end

  def new

  end

  def create
    @user = User.find(1)
    params_to_save = post_params
    @user.food.create!(params_to_save)
    redirect_to foods_path
  end

  private

  def post_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end

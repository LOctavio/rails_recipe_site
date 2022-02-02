class IngredientsController < ApplicationController
  def index; end

  def new
    @foods = Food.all
  end

  def create; end
end

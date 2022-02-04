class GeneralShoppingListsController < ApplicationController
  def index
    @user = User.new
    @ingredients = @user.missing_ingredients(current_user.id)
  end
end

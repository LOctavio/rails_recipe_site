class GeneralShoppingListsController < ApplicationController
  def index
    @ingredients = current_user.missing_ingredients
  end
end

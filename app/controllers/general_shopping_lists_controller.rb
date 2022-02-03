class GeneralShoppingListsController < ApplicationController
  def index
    @ingredients = curren_user.missing_ingredients
  end
end

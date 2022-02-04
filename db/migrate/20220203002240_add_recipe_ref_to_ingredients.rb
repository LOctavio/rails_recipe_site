class AddRecipeRefToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_reference :ingredients, :recipe, null: false, foreign_key: true
    add_reference :ingredients, :food, null: false, foreign_key: true
  end
end

class Recipe < ApplicationRecord
  has_many :recipe_food
  belongs_to :user

  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true

  def show_foods(recipe_id)
    foods_recipes = []
    array_of_recipes = RecipesFood.includes(:recipe).where("recipe_id = #{recipe_id}")
    array_of_recipes.each do |r|
      food = Food.find(r.food_id)
      foods_recipes.push(food)
    end
    foods_recipes
  end
end

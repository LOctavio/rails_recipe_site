class Recipe < ApplicationRecord
  has_many :ingredient
  belongs_to :user

  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true

  def show_foods(recipe_id)
    foods_ingredients = []
    array_of_ingredients = Ingredient.includes(:recipe).where("recipe_id = #{recipe_id}")
    array_of_ingredients.each do |r|
      food = Food.find(r.food_id)
      # create a hash to store required data
      h = {
        ingredient_id: r.id, ingredient_quantity: r.quantity,
        ingredient_value: r.quantity * food.price, food_name: food.name,
        food_measurement_unit: food.measurement_unit
      }
      foods_ingredients.push(h)
    end
    foods_ingredients
  end

  def total_food_items
    ingredient.all.count
  end

  def total_price
    total = 0
    ingredient.all.each do |ingredient|
      total += ingredient.quantity * ingredient.food.price
    end
    total
  end
end

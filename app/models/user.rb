class User < ApplicationRecord
  has_many :food
  has_many :recipe

  def missing_ingredients
    food.joins(:ingredient)
      .select(
        'foods.name,
        SUM(ingredients.quantity) as quantity,
        SUM(foods.price * ingredients.quantity) as price,
        foods.measurement_unit'
      )
      .group('foods.name, foods.measurement_unit')
  end
end

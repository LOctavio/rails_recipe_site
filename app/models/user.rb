class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :food
  has_many :recipe

  def missing_ingredients
    recipe.joins(ingredient: :food)
      .select(
        'foods.name,
        SUM(ingredients.quantity) as quantity,
        SUM(foods.price * ingredients.quantity) as price,
        foods.measurement_unit'
      )
      .group('foods.name, foods.measurement_unit')
  end

  def food_items_to_buy
    missing_ingredients.length
  end

  def value_of_food_needed
    total = 0
    missing_ingredients.each do |ingredient|
      total += ingredient.price
    end
    total
  end
end

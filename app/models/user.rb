class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :food
  has_many :recipe

  def missing_ingredients(id)
    # food.joins(:ingredient)
    #   .select(
    #     'foods.name,
    #     SUM(ingredients.quantity) as quantity,
    #     SUM(foods.price * ingredients.quantity) as price,
    #     foods.measurement_unit'
    #   )
    #   .group('foods.name, foods.measurement_unit')
    Recipe.includes(:ingredient).where(user_id:id)
  end
end

class Recipe < ApplicationRecord
  has_many :ingredient, dependent: :delete_all
  belongs_to :user

  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true

  def show_foods(recipe_id)
    Ingredient.includes(:recipe, :food).where(recipe_id: recipe_id)
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

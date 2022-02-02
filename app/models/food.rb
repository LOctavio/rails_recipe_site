class Food < ApplicationRecord
  has_many :ingredient
  belongs_to :user
  validates :name, uniqueness: { message: 'name is already taken' }, presence: true

  validates :measurement_unit, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

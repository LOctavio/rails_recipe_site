class Food < ActiveRecord::Base
  has_many :recipesfoods
  belongs_to :user
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

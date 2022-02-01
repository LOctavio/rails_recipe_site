class Food < ActiveRecord::Base
  has_many :recipefood
  belongs_to :user
  validates :name, uniqueness: true {message: 'name is already taken'}, presence: true
  
  validates :measurement_unit, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

class Recipe < ActiveRecord::Base
  has_many :recipesfoods
  belongs_to :user

  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true
end

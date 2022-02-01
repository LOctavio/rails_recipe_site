class User < ActiveRecord::Base
  has_many :food
  has_many :recipe
end

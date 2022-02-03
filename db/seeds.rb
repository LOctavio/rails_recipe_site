# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name:'mike',email:'mike@gmail.com',password:'123456')
user2 = User.create(name:'luis',email:'luis@gmail.com',password:'123456')

user.food.create(name: 'peanut butter', measurement_unit: 'grams', price: 5)
user.food.create(name: 'sugar', measurement_unit: 'grams', price: 3)
user.food.create(name: 'egg', measurement_unit: 'units', price: 2)
user.food.create(name: 'chocolate', measurement_unit: 'grams', price: 3)
user.food.create(name: 'flour', measurement_unit: 'grams', price: 1)

user.recipe.create(name: 'Peanut Butter Cookies', preparation_time: '20 minutes', cooking_time: '10 minutes', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse cursus.', public: true)
user.recipe.create(name: 'Chocolate Hazelnut Mug Cakes', preparation_time: '20 minutes', cooking_time: '10 minutes', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse cursus.', public: true)

Ingredient.create(quantity:5,food_id:1,recipe_id:1)
Ingredient.create(quantity:7,food_id:2,recipe_id:1)
Ingredient.create(quantity:10,food_id:3,recipe_id:1)
Ingredient.create(quantity:2,food_id:3,recipe_id:2)
Ingredient.create(quantity:4,food_id:4,recipe_id:2)
Ingredient.create(quantity:10,food_id:5,recipe_id:2)
class CreateRecipesFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes_foods do |t|
      t.integer :quantity
      t.integer :food_id
      t.integer :recipe_id

      t.timestamps
    end
    add_index :recipes_foods, :food_id
    add_index :recipes_foods, :recipe_id
  end
end

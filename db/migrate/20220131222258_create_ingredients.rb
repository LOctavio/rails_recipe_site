class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.integer :quantity
      t.integer :food_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end

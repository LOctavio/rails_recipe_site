class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.text :name
      t.text :preparation_time
      t.text :cooking_time
      t.text :description
      t.boolean :public
      t.integer :user_id

      t.timestamps
    end
    add_index :recipes, :user_id
  end
end

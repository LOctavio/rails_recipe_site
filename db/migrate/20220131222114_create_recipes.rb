class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.text :name
      t.text :preparation_time
      t.text :cooking_time
      t.text :description
      t.boolean :public, :default => false
      

      t.timestamps
    end
    
  end
end

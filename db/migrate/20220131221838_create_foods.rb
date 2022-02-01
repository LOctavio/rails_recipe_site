class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.text :name
      t.text :measurement_unit
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
    add_index :foods, :user_id
  end
end

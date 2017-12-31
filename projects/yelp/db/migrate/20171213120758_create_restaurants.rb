class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.integer :min_price
      t.integer :max_price
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end

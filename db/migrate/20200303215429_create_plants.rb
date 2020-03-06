class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.string :image
      t.float :price
      t.string :light_instructions
      t.string :water_instructions
      t.string :other_instructions

      t.timestamps
    end
  end
end

class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.float :total, default: 0
      t.timestamps
    end
  end
end

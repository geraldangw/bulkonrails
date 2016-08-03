class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :product
      t.text :description
      t.string :category
      t.string :brand
      t.float :price
      t.string :picture

      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :products, [:user_id, :created_at]
  end
end

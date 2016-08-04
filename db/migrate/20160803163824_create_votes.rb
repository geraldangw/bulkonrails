class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
          add_index :votes, [:user_id, :created_at]
          add_index :votes, [:product_id, :created_at]
  end
end

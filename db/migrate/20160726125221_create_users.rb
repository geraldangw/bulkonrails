class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :salutation
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :contactnum
      t.string :address
      t.integer :zipcode
      t.string :country
      t.timestamps
    end
  end
end

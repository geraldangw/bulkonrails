class AddTargetToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :target, :integer
  end
end

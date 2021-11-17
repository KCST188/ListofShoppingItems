class AddUserIdToListShoppings < ActiveRecord::Migration[6.1]
  def change
    add_column :list_shoppings, :user_id, :integer
    add_index :list_shoppings, :user_id
  end
end

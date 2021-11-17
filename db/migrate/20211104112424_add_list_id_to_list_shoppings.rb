class AddListIdToListShoppings < ActiveRecord::Migration[6.1]
  def change
    add_column :list_shoppings, :list_id, :integer
    add_index :list_shoppings, :list_id
  end
end

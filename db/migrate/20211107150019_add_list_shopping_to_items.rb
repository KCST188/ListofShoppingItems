class AddListShoppingToItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :list_shopping, null: false, foreign_key: true
  end
end

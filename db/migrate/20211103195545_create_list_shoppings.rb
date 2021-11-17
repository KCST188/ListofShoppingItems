class CreateListShoppings < ActiveRecord::Migration[6.1]
  def change
    create_table :list_shoppings do |t|
      t.string :name

      t.timestamps
    end
  end
end

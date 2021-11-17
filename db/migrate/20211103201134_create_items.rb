class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :product
      t.integer :amount

      t.timestamps
    end
  end
end

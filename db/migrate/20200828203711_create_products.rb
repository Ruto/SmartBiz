class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :alias
      t.boolean :goods
      t.boolean :service
      t.boolean :experience
      t.boolean :income
      t.boolean :expense
      t.string :durability
      t.string :consumer_product
      t.string :industrial_product
      t.boolean :divisible
      t.boolean :value_addable
      t.boolean :active
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

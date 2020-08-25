class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.boolean :income, default: false
      t.boolean :expense, default: false
      t.boolean :resale, default: false
      t.boolean :divisible, default: false
      t.boolean :value_addable, default: false
      t.boolean :active, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

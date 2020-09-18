class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :alias
      t.string :type
      t.string :ancestry
      t.string :category
      t.boolean :income
      t.boolean :direct_expense
      t.boolean :indirect_expense
      t.boolean :adminstrative_cost
      t.boolean :active, default: false
      t.references :user, null: false, foreign_key: true
   #  t.string :workflow_state

      t.timestamps
    end
    add_index :organizations, [:ancestry]
  end
end

# Product Qualities
#t.boolean :experience
#t.string :durability
#t.string :consumer_product
#t.string :industrial_product
#t.boolean :divisible
#t.boolean :expirable
#t.boolean :value_addable

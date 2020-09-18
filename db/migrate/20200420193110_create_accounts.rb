class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :account_type
      t.string :account_number
      t.text :desc
      t.boolean :active, default: false
      t.references :user, null: false, foreign_key: true
      t.boolean :fully_approved, default: false
   #  t.string :workflow_state    

      t.timestamps
    end
  end
end

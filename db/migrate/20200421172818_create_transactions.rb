class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :payable, polymorphic: true, null: false
      t.references :structure, null: false, foreign_key: true
      t.string :type
      t.float :money_in
      t.float :money_out
      t.float :transaction_cost
      t.float :balance
      t.float :total_balance
      t.text :memo
      t.references :account, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :fully_approved, default: false
   #  t.string :workflow_state
   
      t.timestamps
    end
  end
end

json.extract! transaction, :id, :transactionable_id, :transactionable_type, :structure_id, :type, :money_in, :money_out, :transaction_cost, :balance, :total_balance, :memo, :image_id, :account_id, :user_id, :closed, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)

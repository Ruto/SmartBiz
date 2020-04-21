json.extract! transaction, :id, :payable_id, :payable_type, :structure_id, :type, :money_in, :money_out, :transaction_cost, :balance, :total_balance, :memo, :image_id, :account_id, :user_id, :checked, :closed, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)

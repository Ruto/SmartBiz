json.extract! account, :id, :name, :account_type, :account_number, :desc, :active, :user_id, :fully_approved, :created_at, :updated_at
json.url account_url(account, format: :json)

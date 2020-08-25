json.extract! product, :id, :name, :code, :income, :expense, :resale, :divisible, :value_addable, :active, :created_at, :updated_at
json.url v1_product_url(product, format: :json)

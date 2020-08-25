json.data do
  json.product do
    json.call(
      @product,
      :id,
      :name,
      :code,
      :income,
      :expense,
      :resale,
      :divisible,
      :value_addable,
      :active,
      :user_id,
      :created_at,
      :updated_at

    )
  end
end

json.data do
  json.code do
    json.call(
      @code,
      :id,
      :cost_code,
      :system_code,
      :codable_id,
      :codable_type,
      :active,
      :user_id,
      :created_at,
      :updated_at

    )
  end
end

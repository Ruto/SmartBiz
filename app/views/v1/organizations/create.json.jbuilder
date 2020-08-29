json.data do
  json.organization do
    json.call(
      @organization,
      :id,
      :name,
      :alias,
      :type,
      :category,
      :income,
      :direct_expense,
      :indirect_expense,
      :administrative_cost,
      :active,
      :created_at,
      :updated_at

    )
  end
end

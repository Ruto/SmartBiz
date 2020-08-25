json.data do
  json.profile do
    json.call(
      @profile,
      :id,
      :username,
      :phone,
      :email,
      :phone_token,
      :email_token,
      :user_id,
      :structure_id,
      :desc,
      :inviter,
      :confirmed_profile,
      :revoke_profile,
      :confirmed_by,
      :revoked_by,
      :created_at,
      :updated_at

    )
  end
end

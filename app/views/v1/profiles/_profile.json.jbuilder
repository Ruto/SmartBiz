json.extract! profile, :id, :username, :phone, :email, :phone_token, :email_token, :user_id, :structure_id, :desc, :inviter, :confirmed_profile, :revoke_profile, :confirmed_by, :revoked_by, :created_at, :updated_at
json.url v1_profile_url(profile, format: :json)

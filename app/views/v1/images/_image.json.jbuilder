json.extract! image, :id, :name, :desc, :memo, :imageable_id, :imageable_type, :checked, :created_at, :updated_at
json.url image_url(image, format: :json)

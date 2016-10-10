json.extract! item, :id, :name, :image_url, :media_type_id, :created_at, :updated_at
json.url item_url(item, format: :json)
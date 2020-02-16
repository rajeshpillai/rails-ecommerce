json.extract! category, :id, :name, :description, :parent_category_id, :created_at, :updated_at
json.url category_url(category, format: :json)

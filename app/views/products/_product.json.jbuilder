json.extract! product, :id, :name, :description, :sku, :list_price, :type, :quantity, :status, :created_at, :updated_at
json.url product_url(product, format: :json)

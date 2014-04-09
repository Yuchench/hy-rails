json.array!(@products) do |product|
  json.extract! product, :id, :name_id, :name, :product_type, :content
  json.url product_url(product, format: :json)
end

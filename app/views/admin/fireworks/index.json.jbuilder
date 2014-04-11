json.array!(@fireworks) do |firework|
  json.extract! firework, :id, :name_id, :name, :product_type, :content
  json.url firework_url(firework, format: :json)
end

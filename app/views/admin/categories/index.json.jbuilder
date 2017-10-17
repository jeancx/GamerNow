json.array!(@categories) do |category|
  json.extract! category, :title, :description, :category_id
  json.url category_url(category, format: :json)
end
json.array!(@pages) do |page|
  json.extract! page, :title, :description, :category_id
  json.url page_url(page, format: :json)
end
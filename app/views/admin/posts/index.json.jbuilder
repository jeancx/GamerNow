json.array!(@posts) do |post|
  json.extract! post, :title, :categories, :date, :status
  json.url post_url(post, format: :json)
end
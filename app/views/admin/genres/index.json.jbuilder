json.array!(@genres) do |genre|
  json.extract! genre, :title, :description
  json.url genre_url(genre, format: :json)
end
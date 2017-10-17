json.array!(@images) do |image|
  json.extract! image, :description, :file
  json.url image_url(image, format: :json)
end
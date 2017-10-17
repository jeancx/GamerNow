json.array!(@slides) do |slide|
  json.extract! slide, :category, :title, :image
  json.url slide_url(slide, format: :json)
end
json.array!(@adverts) do |advert|
  json.extract! advert, :title, :description
  json.url advert_url(advert, format: :json)
end
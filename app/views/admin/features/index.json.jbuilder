json.array!(@features) do |feature|
  json.extract! feature, :image_a, :image_b, :post_id, :published
  json.url feature_url(feature, format: :json)
end
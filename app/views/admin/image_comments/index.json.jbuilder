json.array!(@image_comments) do |image_comment|
  json.extract! image_comment, :user_id, :image_id, :content
  json.url image_comment_url(image_comment, format: :json)
end
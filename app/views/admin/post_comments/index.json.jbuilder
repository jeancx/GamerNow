json.array!(@post_comments) do |post_comment|
  json.extract! post_comment, :user_id, :post_id, :content
  json.url post_comment_url(post_comment, format: :json)
end
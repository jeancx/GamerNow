json.array!(@video_comments) do |video_comment|
  json.extract! video_comment, :user_id, :video_id, :content
  json.url video_comment_url(video_comment, format: :json)
end
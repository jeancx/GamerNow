json.array!(@channels) do |channel|
  json.extract! channel, :title, :content, :logo
  json.url channel_url(channel, format: :json)
end
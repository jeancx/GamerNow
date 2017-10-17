json.array!(@platforms) do |platform|
  json.extract! platform, :name, :logo, :content, :date, :status
  json.url platform_url(platform, format: :json)
end
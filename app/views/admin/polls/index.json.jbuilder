json.array!(@polls) do |poll|
  json.extract! poll, :title, :slug, :status
  json.url poll_url(poll, format: :json)
end
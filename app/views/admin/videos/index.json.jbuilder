json.array!(@videos) do |video|
  json.extract! video, :provider, :title, :vid
  json.url video_url(video, format: :json)
end
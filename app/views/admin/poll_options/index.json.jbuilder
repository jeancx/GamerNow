json.array!(@poll_options) do |poll_option|
  json.extract! poll_option, :poll_id, :name
  json.url poll_option_url(poll_option, format: :json)
end
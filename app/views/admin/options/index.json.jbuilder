json.array!(@options) do |option|
  json.extract! option, :type, :name, :value
  json.url option_url(option, format: :json)
end
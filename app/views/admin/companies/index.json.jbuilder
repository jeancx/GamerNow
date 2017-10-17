json.array!(@companies) do |company|
  json.extract! company, :title, :logo, :description
  json.url company_url(company, format: :json)
end
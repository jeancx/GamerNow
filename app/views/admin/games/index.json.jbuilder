json.array!(@games) do |game|
  json.extract! game, :title, :content, :cover, :background, :date, :mature, :status
  #json.url game_url(game, format: :json)
end
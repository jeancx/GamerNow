class GameGenre < ActiveRecord::Base
  belongs_to :genre
  belongs_to :game
end

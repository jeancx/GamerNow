class GameDeveloper < ActiveRecord::Base
  belongs_to :company
  belongs_to :game
end

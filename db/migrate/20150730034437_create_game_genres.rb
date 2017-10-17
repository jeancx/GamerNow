class CreateGameGenres < ActiveRecord::Migration
  def change
    create_table :game_genres do |t|
      t.belongs_to :game
      t.belongs_to :genre
    end
  end
end

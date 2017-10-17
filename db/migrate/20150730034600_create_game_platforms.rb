class CreateGamePlatforms < ActiveRecord::Migration
  def change
    create_table :game_platforms do |t|
      t.belongs_to :game
      t.belongs_to :platform
    end
  end
end

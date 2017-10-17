class CreatePostGames < ActiveRecord::Migration
  def change
    create_table :post_games do |t|
      t.belongs_to :post
      t.belongs_to :game
    end
  end
end

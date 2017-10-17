class CreateGamePublishers < ActiveRecord::Migration
  def change
    create_table :game_publishers do |t|
      t.belongs_to :game
      t.belongs_to :company
      t.timestamps null: false
    end
  end
end

class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :canal
      t.string :provider
      t.string :title
      t.text :description
      t.string :vid
      t.integer :views, :limit => 8
      t.references :game, index: true
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end

class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.text :content
      t.string :cover
      t.string :background
      t.datetime :date
      t.decimal :score, :precision => 10, :scale => 1
      t.decimal :ext_score, :precision => 10, :scale => 1
      t.decimal :user_score, :precision => 10, :scale => 1
      t.text :mature
      t.string :status
      t.integer :views, :limit => 8
      t.timestamps null: false
    end
  end
end

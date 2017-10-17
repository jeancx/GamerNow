class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :image
      t.string :background
      t.datetime :date
      t.string :status
      t.references :category, index: true
      t.references :user
      t.integer :views, :limit => 8
      t.timestamps null: false
    end
  end
end

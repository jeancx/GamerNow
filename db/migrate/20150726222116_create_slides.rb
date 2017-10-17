class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :category
      t.string :title
      t.string :image
      t.boolean :published
      t.timestamps null: false
    end
  end
end

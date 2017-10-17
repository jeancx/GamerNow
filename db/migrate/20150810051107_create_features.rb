class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :image_a
      t.string :image_b
      t.belongs_to :post
      t.boolean :published

      t.timestamps null: false
    end
  end
end

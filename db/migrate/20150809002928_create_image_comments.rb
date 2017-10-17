class CreateImageComments < ActiveRecord::Migration
  def change
    create_table :image_comments do |t|
      t.belongs_to :user
      t.belongs_to :image
      t.text :content

      t.timestamps null: false
    end
  end
end

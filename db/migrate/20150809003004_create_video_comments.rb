class CreateVideoComments < ActiveRecord::Migration
  def change
    create_table :video_comments do |t|
      t.belongs_to :user
      t.belongs_to :video
      t.text :content

      t.timestamps null: false
    end
  end
end

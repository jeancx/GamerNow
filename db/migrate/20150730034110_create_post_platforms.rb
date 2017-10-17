class CreatePostPlatforms < ActiveRecord::Migration
  def change
    create_table :post_platforms do |t|
      t.belongs_to :post
      t.belongs_to :platform
    end
  end
end

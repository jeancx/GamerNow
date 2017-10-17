class CreatePlatforms < ActiveRecord::Migration
  def change
    create_table :platforms do |t|
      t.string :shortname
      t.string :name
      t.string :logo
      t.string :background
      t.text :content
      t.datetime :date
      t.string :status
      t.integer :views, :limit => 8
      t.timestamps null: false
    end
  end
end

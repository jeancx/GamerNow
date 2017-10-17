class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :type
      t.string :description
      t.string :file
      t.integer :views, :limit => 8
      t.references :game
      t.references :user
      t.timestamps null: false
    end
  end
end

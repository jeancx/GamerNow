class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :title
      t.text :content
      t.string :logo
      t.string :background

      t.timestamps null: false
    end
  end
end

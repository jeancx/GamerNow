class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.string :title
      t.string :description
      t.integer :clicks, :limit => 8
      t.timestamps null: false
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :description
      t.string :avatar
      t.string :background
      t.date :birthday
      t.string :gender
      t.timestamps null: false
    end
  end
end

class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :title
      t.string :slug
      t.string :status

      t.timestamps null: false
    end
  end
end

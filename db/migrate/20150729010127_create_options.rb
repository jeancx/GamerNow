class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :type
      t.string :name
      t.text :value
      t.timestamps null: false
    end
  end
end

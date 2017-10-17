class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.references :category
      t.text :description
      t.timestamps null: false
    end
  end
end

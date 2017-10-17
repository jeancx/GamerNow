class CreatePollOptions < ActiveRecord::Migration
  def change
    create_table :poll_options do |t|
      t.references :poll, index: true
      t.string :name

      t.timestamps null: false
    end
    add_foreign_key :poll_options, :polls
  end
end

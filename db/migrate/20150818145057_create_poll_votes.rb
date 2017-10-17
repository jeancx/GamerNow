class CreatePollVotes < ActiveRecord::Migration
  def change
    create_table :poll_votes do |t|
      t.references :poll, index: true
      t.references :poll_option, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :poll_votes, :poll_options
    add_foreign_key :poll_votes, :users
  end
end

class CreateChannelMembers < ActiveRecord::Migration
  def change
    create_table :channel_members do |t|
      t.references :channel
      t.references :user

      t.timestamps null: false
    end
  end
end

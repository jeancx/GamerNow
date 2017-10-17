class AddIpToPollVotes < ActiveRecord::Migration

  def change
    add_column :poll_votes, :ip, :string
  end

end

class PollVote < ActiveRecord::Base
  belongs_to :poll
  belongs_to :poll_option
  belongs_to :user
end

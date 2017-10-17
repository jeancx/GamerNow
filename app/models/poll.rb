class Poll < ActiveRecord::Base
  has_many :poll_options
  has_many :poll_votes
end

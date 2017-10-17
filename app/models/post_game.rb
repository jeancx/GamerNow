class PostGame < ActiveRecord::Base
  belongs_to :post
  belongs_to :game
end

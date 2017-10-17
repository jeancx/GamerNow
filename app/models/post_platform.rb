class PostPlatform < ActiveRecord::Base
  belongs_to :post
  belongs_to :platform
end

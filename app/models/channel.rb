class Channel < ActiveRecord::Base

  has_many :users
  has_many :videos

end

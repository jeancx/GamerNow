class Game < ActiveRecord::Base

  mount_uploader :cover, CoverUploader
  mount_uploader :background, BackgroundUploader

  has_many :game_platforms
  has_many :platforms, :through => :game_platforms, :source => :platform

  def link
    "/games/"+ self.id.to_s + "-" + self.title.downcase.gsub(" ", "-")
  end

end

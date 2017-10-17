class Video < ActiveRecord::Base

  belongs_to :user

  def image
    "http://img.youtube.com/vi/" + self.vid + "/0.jpg"
  end

  def next
    Video.where("id > ?", id).first
  end

  def prev
    Video.where("id < ?", id).last
  end

  def link
    "/videos/" + self.id.to_s + "-" + self.title.downcase.gsub(" ", "-").gsub("/","-")
  end


end

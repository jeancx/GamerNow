class Post < ActiveRecord::Base

  before_save :default_values

  belongs_to :user

  belongs_to :image

  belongs_to :category

  has_many :post_platforms
  has_many :platforms, through: :post_platforms

  has_many :post_games
  has_many :games, through: :post_games

  has_many :comments

  def next
    Post.where("id > ?", id).where("category_id = ?", category_id).first
  end

  def prev
    Post.where("id < ?", id).where("category_id = ?", category_id).last
  end

  def default_values
    self.date = DateTime.now
  end

  def link
    "/"+self.category.slug+"/"+ self.id.to_s + "-" + self.title.downcase.gsub(" ", "-").gsub("/","-")
  end

end

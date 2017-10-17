class HomeController < ApplicationController

  def index
    @news1 = Post.where("image_id IS NOT NULL").where("category_id = 1").where(status: "published").last
    @news2 = Post.where("image_id IS NOT NULL").where("category_id = 1").where(status: "published").order("date DESC").limit(4).offset(1)
    @news3 = Post.where("image_id IS NOT NULL").where("category_id = 1").where(status: "published").order("date DESC").limit(4).offset(5)

    @images = Image.take(9)

    @reviews1 = Post.where("image_id IS NOT NULL").where("category_id = 2").where(status: "published").last
    @reviews2 = Post.where("image_id IS NOT NULL").where("category_id = 2").where(status: "published").order("date DESC").limit(4).offset(1)
    @reviews3 = Post.where("image_id IS NOT NULL").where("category_id = 2").where(status: "published").order("date DESC").limit(4).offset(5)

  end

end

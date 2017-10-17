class ReviewsController < ApplicationController

  layout "reviews"

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 10).where("category_id = 2").where(status: "published").order('date DESC')
  end

  def show
    @post = Post.where("category_id = 2").where(status: "published").find(params[:id])
  end

end

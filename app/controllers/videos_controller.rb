class VideosController < ApplicationController

  layout "videos"

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def index
    @videos = Video.paginate(:page => params[:page], :per_page => 10).order('id DESC')
  end

  def show
    @video = Video.find(params[:id])
  end

end

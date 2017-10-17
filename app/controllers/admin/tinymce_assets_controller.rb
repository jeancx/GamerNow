class Admin::TinymceAssetsController < ApplicationController

  respond_to :json

  def upload

    @image = Image.new
    @image.file = params[:file]
    @image.description = params[:alt]
    @image.save

    img = ::MiniMagick::Image.open(@image.file)

    render json: {
               image: {
                   url: image.file,
                   height: img.width,
                   width: img.width
               }
           }, layout: false, content_type: "text/html"
  end


end

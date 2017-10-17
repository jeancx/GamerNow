class Admin::RestController < ApplicationController

  before_action :authenticate_user!
  layout "blank"

  def games

    @games = Game.all
    @games = Game.where('title ILIKE :q', :q=>"%#{params[:mt_filter]}%") if params[:mt_filter].present?
    render :json => '{"status":"empty", "message":"Nemhum resultado Encontrado"}' if @games.length == 0

  end

end

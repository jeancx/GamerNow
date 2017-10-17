class GamesController < ApplicationController

  layout "games"

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def index

  end

  def show
    @game = Game.find(params[:id])
  end


end

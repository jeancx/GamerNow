class PollsController < ApplicationController

  layout false

  def vote

    data = Rack::Utils.parse_nested_query(params[:data]).deep_symbolize_keys

    @vote = PollVote.where(poll_id: params[:id], user_id: current_user.id).take(1);

    if !@vote.present?
      PollVote.create(poll_id: params[:id], poll_option_id: data[:poll_option], user_id: current_user.id)
      render :json => true
    else
      render :json => false
    end

  end

  def show
    @poll = Poll.find(params[:id])
  end

  def results
    @poll = Poll.find(params[:id])
  end

end

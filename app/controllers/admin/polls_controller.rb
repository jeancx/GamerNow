class Admin::PollsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_poll, only: [:show, :edit, :update, :destroy]
  layout "administration"

  # GET /admin/polls
  # GET /admin/polls.json
  def index
    @polls = Poll.paginate(:page => params[:page], :per_page => 10).order('id DESC').accessible_by(current_ability)
  end

  # GET /admin/polls/1
  # GET /admin/polls/1.json
  def show
  end

  # GET /admin/polls/new
  def new
    @poll = Poll.new
  end

  # GET /admin/polls/1/edit
  def edit
  end

  # POST /admin/polls
  # POST /admin/polls.json
  def create
    @poll = Poll.new(poll_params)

    respond_to do |format|
      if @poll.save
        format.html { redirect_to [:admin, @poll], notice: 'Poll was successfully created.' }
        format.json { render action: 'show', status: :created, location: @poll }
      else
        format.html { render action: 'new' }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/polls/1
  # PATCH/PUT /admin/polls/1.json
  def update
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to [:admin, @poll], notice: 'Poll was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/polls/1
  # DELETE /admin/polls/1.json
  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to admin_polls_url, notice: 'Poll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_poll
    @poll = Poll.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def poll_params
    params.require(:poll).permit(:title, :slug, :status)
  end
end

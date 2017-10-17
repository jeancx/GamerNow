class Admin::PollOptionsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_poll_option, only: [:show, :edit, :update, :destroy]
  layout "administration"

  # GET /admin/poll_options
  # GET /admin/poll_options.json
  def index

    if params[:id].present?
      @poll_options = PollOption
          .paginate(:page => params[:page], :per_page => 10)
          .where(poll_id: params[:id])
          .order('id DESC').accessible_by(current_ability)
    else
      redirect_to admin_polls_path
    end
  end

  # GET /admin/poll_options/1
  # GET /admin/poll_options/1.json
  def show
  end

  # GET /admin/poll_options/new
  def new
    @poll_option = PollOption.new
  end

  # GET /admin/poll_options/1/edit
  def edit
  end

  # POST /admin/poll_options
  # POST /admin/poll_options.json
  def create

    @poll_option = PollOption.new(poll_option_params)

    respond_to do |format|
      if @poll_option.save
        format.html { redirect_to [:admin, @poll_option], notice: 'Poll option was successfully created.' }
        format.json { render action: 'show', status: :created, location: @poll_option }
      else
        format.html { render action: 'new' }
        format.json { render json: @poll_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/poll_options/1
  # PATCH/PUT /admin/poll_options/1.json
  def update
    respond_to do |format|
      if @poll_option.update(poll_option_params)
        format.html { redirect_to [:admin, @poll_option], notice: 'Poll option was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @poll_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/poll_options/1
  # DELETE /admin/poll_options/1.json
  def destroy
    @poll_option.destroy
    respond_to do |format|
      format.html { redirect_to admin_poll_options_url, notice: 'Poll option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll_option
      @poll_option = PollOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_option_params
      params.require(:poll_option).permit(:poll_id, :name)
    end
end

class Admin::ChannelsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_channel, only: [:show, :edit, :update, :destroy]
  layout "administration"

  # GET /admin/channels
  # GET /admin/channels.json
  def index
    @channels = Channel.paginate(:page => params[:page], :per_page => 10).order('id DESC').accessible_by(current_ability)
  end

  # GET /admin/channels/1
  # GET /admin/channels/1.json
  def show
  end

  # GET /admin/channels/new
  def new
    @channel = Channel.new
  end

  # GET /admin/channels/1/edit
  def edit
  end

  # POST /admin/channels
  # POST /admin/channels.json
  def create
    @channel = Channel.new(channel_params)

    respond_to do |format|
      if @channel.save
        format.html { redirect_to [:admin, @channel], notice: 'Channel was successfully created.' }
        format.json { render action: 'show', status: :created, location: @channel }
      else
        format.html { render action: 'new' }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/channels/1
  # PATCH/PUT /admin/channels/1.json
  def update
    respond_to do |format|
      if @channel.update(channel_params)
        format.html { redirect_to [:admin, @channel], notice: 'Channel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/channels/1
  # DELETE /admin/channels/1.json
  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to admin_channels_url, notice: 'Channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.where(id: params[:id]).accessible_by(current_ability).take
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_params
      params.require(:channel).permit(:title, :content, :logo)
    end
end

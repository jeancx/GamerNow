class Admin::PlatformsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_platform, only: [:show, :edit, :update, :destroy]
  layout "administration"

  # GET /admin/platforms
  # GET /admin/platforms.json
  def index
    @platforms = Platform.paginate(:page => params[:page], :per_page => 10).order('id DESC').accessible_by(current_ability)
  end

  # GET /admin/platforms/1
  # GET /admin/platforms/1.json
  def show
  end

  # GET /admin/platforms/new
  def new
    @platform = Platform.new
  end

  # GET /admin/platforms/1/edit
  def edit
  end

  # POST /admin/platforms
  # POST /admin/platforms.json
  def create
    @platform = Platform.new(platform_params)

    respond_to do |format|
      if @platform.save
        format.html { redirect_to [:admin, @platform], notice: 'Platform was successfully created.' }
        format.json { render action: 'show', status: :created, location: @platform }
      else
        format.html { render action: 'new' }
        format.json { render json: @platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/platforms/1
  # PATCH/PUT /admin/platforms/1.json
  def update
    respond_to do |format|
      if @platform.update(platform_params)
        format.html { redirect_to [:admin, @platform], notice: 'Platform was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/platforms/1
  # DELETE /admin/platforms/1.json
  def destroy
    @platform.destroy
    respond_to do |format|
      format.html { redirect_to admin_platforms_url, notice: 'Platform was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_platform
      @platform = Platform.where(id: params[:id]).accessible_by(current_ability).take
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def platform_params
      params.require(:platform).permit(:shortname, :name, :background, :logo, :content, :date, :status)
    end

end

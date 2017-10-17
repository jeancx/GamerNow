class Admin::OptionsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_option, only: [:show, :edit, :update, :destroy]
  layout "administration"

  # GET /admin/options
  # GET /admin/options.json
  def index
    @options = Option.paginate(:page => params[:page], :per_page => 10).order('id DESC').accessible_by(current_ability)
  end

  # GET /admin/options/1
  # GET /admin/options/1.json
  def show
  end

  # GET /admin/options/new
  def new
    @option = Option.new
  end

  # GET /admin/options/1/edit
  def edit
  end

  # POST /admin/options
  # POST /admin/options.json
  def create
    @option = Option.new(option_params)

    respond_to do |format|
      if @option.save
        format.html { redirect_to [:admin, @option], notice: 'Option was successfully created.' }
        format.json { render action: 'show', status: :created, location: @option }
      else
        format.html { render action: 'new' }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/options/1
  # PATCH/PUT /admin/options/1.json
  def update
    respond_to do |format|
      if @option.update(option_params)
        format.html { redirect_to [:admin, @option], notice: 'Option was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/options/1
  # DELETE /admin/options/1.json
  def destroy
    @option.destroy
    respond_to do |format|
      format.html { redirect_to admin_options_url, notice: 'Option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option
      @option = Option.where(id: params[:id]).accessible_by(current_ability).take
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def option_params
      params.require(:option).permit(:type, :name, :value)
    end

end

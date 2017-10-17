class Admin::AdvertsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_advert, only: [:show, :edit, :update, :destroy]
  layout "administration"

  # GET /admin/adverts
  # GET /admin/adverts.json
  def index
    @adverts = Advert.paginate(:page => params[:page], :per_page => 10).order('id DESC').accessible_by(current_ability)
  end

  # GET /admin/adverts/1
  # GET /admin/adverts/1.json
  def show
  end

  # GET /admin/adverts/new
  def new
    @advert = Advert.new
  end

  # GET /admin/adverts/1/edit
  def edit
  end

  # POST /admin/adverts
  # POST /admin/adverts.json
  def create
    @advert = Advert.new(advert_params)

    respond_to do |format|
      if @advert.save
        format.html { redirect_to [:admin, @advert], notice: 'Advert was successfully created.' }
        format.json { render action: 'show', status: :created, location: @advert }
      else
        format.html { render action: 'new' }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/adverts/1
  # PATCH/PUT /admin/adverts/1.json
  def update
    respond_to do |format|
      if @advert.update(advert_params)
        format.html { redirect_to [:admin, @advert], notice: 'Advert was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/adverts/1
  # DELETE /admin/adverts/1.json
  def destroy
    @advert.destroy
    respond_to do |format|
      format.html { redirect_to admin_adverts_url, notice: 'Advert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advert
      @advert = Advert.where(id: params[:id]).accessible_by(current_ability).take
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advert_params
      params.require(:advert).permit(:title, :description)
    end

end

class Admin::ImagesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  layout "administration"

  # GET /admin/images
  # GET /admin/images.json
  def index
    @images = Image.paginate(:page => params[:page], :per_page => 10).order('id DESC').accessible_by(current_ability)
  end

  # GET /admin/images/1
  # GET /admin/images/1.json
  def show
  end

  # GET /admin/images/new
  def new
    @image = Image.new
  end

  # GET /admin/images/1/edit
  def edit
  end

  # POST /admin/images
  # POST /admin/images.json
  def create

    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to [:admin, @image], notice: 'Image was successfully created.' }
        format.json { render action: 'show', status: :created, location: @image }
      else
        format.html { render action: 'new' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/images/1
  # PATCH/PUT /admin/images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to [:admin, @image], notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/images/1
  # DELETE /admin/images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to admin_images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.where(id: params[:id]).accessible_by(current_ability).take
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:description, :file)
    end

    def role_layout
      "administration"
      #logged_in? ? "administration" : "administration"
    end

end

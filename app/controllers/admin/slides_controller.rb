class Admin::SlidesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_slide, only: [:show, :edit, :update, :destroy]
  layout "administration"

  # GET /admin/slides
  # GET /admin/slides.json
  def index
    @slides = Slide.paginate(:page => params[:page], :per_page => 10).order('id DESC').accessible_by(current_ability)
  end

  # GET /admin/slides/1
  # GET /admin/slides/1.json
  def show
  end

  # GET /admin/slides/new
  def new
    @slide = Slide.new
  end

  # GET /admin/slides/1/edit
  def edit
  end

  # POST /admin/slides
  # POST /admin/slides.json
  def create

    @slide = Slide.new(slide_params)

    respond_to do |format|
      if @slide.save
        format.html { redirect_to [:admin, @slide], notice: 'Slide was successfully created.' }
        format.json { render action: 'show', status: :created, location: @slide }
      else
        format.html { render action: 'new' }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/slides/1
  # PATCH/PUT /admin/slides/1.json
  def update
    respond_to do |format|
      if @slide.update(slide_params)
        format.html { redirect_to [:admin, @slide], notice: 'Slide was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/slides/1
  # DELETE /admin/slides/1.json
  def destroy
    @slide.destroy
    respond_to do |format|
      format.html { redirect_to admin_slides_url, notice: 'Slide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slide
      @slide = Slide.where(id: params[:id]).accessible_by(current_ability).take
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slide_params
      params.require(:slide).permit(:category, :title, :image)
    end

end

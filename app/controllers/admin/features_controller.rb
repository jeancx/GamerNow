class Admin::FeaturesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_feature, only: [:show, :edit, :update, :destroy]
  layout "administration"

  # GET /admin/features
  # GET /admin/features.json
  def index
    @features = Feature.paginate(:page => params[:page], :per_page => 10).order('id DESC').accessible_by(current_ability)
  end

  # GET /admin/features/1
  # GET /admin/features/1.json
  def show
  end

  # GET /admin/features/new
  def new
    @feature = Feature.new
  end

  # GET /admin/features/1/edit
  def edit
  end

  # POST /admin/features
  # POST /admin/features.json
  def create
    @feature = Feature.new(feature_params)

    respond_to do |format|
      if @feature.save
        format.html { redirect_to [:admin, @feature], notice: 'Feature was successfully created.' }
        format.json { render action: 'show', status: :created, location: @feature }
      else
        format.html { render action: 'new' }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/features/1
  # PATCH/PUT /admin/features/1.json
  def update
    respond_to do |format|
      if @feature.update(feature_params)
        format.html { redirect_to [:admin, @feature], notice: 'Feature was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/features/1
  # DELETE /admin/features/1.json
  def destroy
    @feature.destroy
    respond_to do |format|
      format.html { redirect_to admin_features_url, notice: 'Feature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feature
      @feature = Feature.where(id: params[:id]).accessible_by(current_ability).take
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feature_params
      params.require(:feature).permit(:image_a, :image_b, :post_id, :published)
    end
end

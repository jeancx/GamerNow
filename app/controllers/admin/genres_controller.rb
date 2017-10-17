class Admin::GenresController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_genre, only: [:show, :edit, :update, :destroy]
  layout "administration"

  # GET /admin/genres
  # GET /admin/genres.json
  def index
    @genres = Genre.paginate(:page => params[:page], :per_page => 10).order('id DESC').accessible_by(current_ability)
  end

  # GET /admin/genres/1
  # GET /admin/genres/1.json
  def show
  end

  # GET /admin/genres/new
  def new
    @genre = Genre.new
  end

  # GET /admin/genres/1/edit
  def edit
  end

  # POST /admin/genres
  # POST /admin/genres.json
  def create
    @genre = Genre.new(genre_params)

    respond_to do |format|
      if @genre.save
        format.html { redirect_to [:admin, @genre], notice: 'Genre was successfully created.' }
        format.json { render action: 'show', status: :created, location: @genre }
      else
        format.html { render action: 'new' }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/genres/1
  # PATCH/PUT /admin/genres/1.json
  def update
    respond_to do |format|
      if @genre.update(genre_params)
        format.html { redirect_to [:admin, @genre], notice: 'Genre was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/genres/1
  # DELETE /admin/genres/1.json
  def destroy
    @genre.destroy
    respond_to do |format|
      format.html { redirect_to admin_genres_url, notice: 'Genre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = Genre.where(id: params[:id]).accessible_by(current_ability).take
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def genre_params
      params.require(:genre).permit(:title, :description)
    end

end

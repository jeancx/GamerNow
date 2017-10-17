class Admin::ImageCommentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_image_comment, only: [:show, :edit, :update, :destroy]
  layout "administration"

  # GET /admin/image_comments
  # GET /admin/image_comments.json
  def index
    @image_comments = ImageComment.paginate(:page => params[:page], :per_page => 10).order('id DESC').accessible_by(current_ability)
  end

  # GET /admin/image_comments/1
  # GET /admin/image_comments/1.json
  def show
  end

  # GET /admin/image_comments/1/edit
  def edit
  end

  # PATCH/PUT /admin/image_comments/1
  # PATCH/PUT /admin/image_comments/1.json
  def update
    respond_to do |format|
      if @image_comment.update(image_comment_params)
        format.html { redirect_to [:admin, @image_comment], notice: 'Image comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/image_comments/1
  # DELETE /admin/image_comments/1.json
  def destroy
    @image_comment.destroy
    respond_to do |format|
      format.html { redirect_to admin_image_comments_url, notice: 'Image comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_comment
      @image_comment = ImageComment.where(id: params[:id]).accessible_by(current_ability).take
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_comment_params
      params.require(:image_comment).permit(:user_id, :image_id, :content)
    end
end

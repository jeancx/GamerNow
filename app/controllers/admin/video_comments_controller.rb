class Admin::VideoCommentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_video_comment, only: [:show, :edit, :update, :destroy]
  layout "administration"

  # GET /admin/video_comments
  # GET /admin/video_comments.json
  def index
    @video_comments = VideoComment.paginate(:page => params[:page], :per_page => 10).order('id DESC').accessible_by(current_ability)
  end

  # GET /admin/video_comments/1
  # GET /admin/video_comments/1.json
  def show
  end

  # GET /admin/video_comments/1/edit
  def edit
  end

  # PATCH/PUT /admin/video_comments/1
  # PATCH/PUT /admin/video_comments/1.json
  def update
    respond_to do |format|
      if @video_comment.update(video_comment_params)
        format.html { redirect_to [:admin, @video_comment], notice: 'Video comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @video_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/video_comments/1
  # DELETE /admin/video_comments/1.json
  def destroy
    @video_comment.destroy
    respond_to do |format|
      format.html { redirect_to admin_video_comments_url, notice: 'Video comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video_comment
      @video_comment = VideoComment.where(id: params[:id]).accessible_by(current_ability).take
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_comment_params
      params.require(:video_comment).permit(:user_id, :video_id, :content)
    end
end

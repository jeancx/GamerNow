class Admin::PostCommentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_post_comment, only: [:show, :edit, :update, :destroy]
  layout "administration"

  # GET /admin/post_comments
  # GET /admin/post_comments.json
  def index
    @post_comments = PostComment.paginate(:page => params[:page], :per_page => 10).order('id DESC').accessible_by(current_ability)
  end

  # GET /admin/post_comments/1
  # GET /admin/post_comments/1.json
  def show
  end

  # GET /admin/post_comments/1/edit
  def edit
  end

  # PATCH/PUT /admin/post_comments/1
  # PATCH/PUT /admin/post_comments/1.json
  def update
    respond_to do |format|
      if @post_comment.update(post_comment_params)
        format.html { redirect_to [:admin, @post_comment], notice: 'Post comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/post_comments/1
  # DELETE /admin/post_comments/1.json
  def destroy
    @post_comment.destroy
    respond_to do |format|
      format.html { redirect_to admin_post_comments_url, notice: 'Post comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_comment
      @post_comment = PostComment.where(id: params[:id]).accessible_by(current_ability).take
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_comment_params
      params.require(:post_comment).permit(:user_id, :post_id, :content)
    end
end

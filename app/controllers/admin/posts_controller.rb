class Admin::PostsController < ApplicationController

  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  layout "administration"

  # GET /admin/posts
  # GET /admin/posts.json
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 10).order('id DESC').accessible_by(current_ability)
  end

  # GET /admin/posts/1
  # GET /admin/posts/1.json
  def show
  end

  # GET /admin/posts/new
  def new
    @post = Post.new
  end

  # GET /admin/posts/1/edit
  def edit
  end

  # POST /admin/posts
  # POST /admin/posts.json
  def create
    @post = Post.new(post_params)

    if params[:post][:commit] == 'Rascunho'
      @post.status = 'draft'
    else
      if current_user.has_role? :author
        @post.status = 'review'
      end
    end

    if (params[:post][:image].present?)
      @post.create_image(description: @post.title, file: params[:post][:image])
    end

    respond_to do |format|
      if @post.save
        format.html { redirect_to [:admin, @post], notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/posts/1
  # PATCH/PUT /admin/posts/1.json
  def update
    respond_to do |format|

      if (params[:post][:image].present?)
        @post.create_image(description: @post.title, file: params[:post][:image])
      end

      if params[:post][:commit] == 'Rascunho'
        @post.status = 'draft'
      else
        if current_user.has_role? :author
          @post.status = 'review'
        end
      end

      if @post.update(update_params)

        format.html { redirect_to [:admin, @post], notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/posts/1
  # DELETE /admin/posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.where(id: params[:id]).accessible_by(current_ability).take
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      gamearray = Array.new
      params[:game_ids].each do |g|
        gamearray.push(g[1])
      end
      params[:game_ids] = gamearray

      params.require(:post)
          .permit(:title, :content, :status, :date, :category_id, :feature_id)
          .merge(user_id: current_user.id, game_ids: gamearray)
    end

    def update_params

      gamearray = Array.new
      if params[:game_ids].present?
        params[:game_ids].each do |g|
          gamearray.push(g[1])
        end
        params[:game_ids] = gamearray
      end

      params.require(:post)
          .permit(:title, :status, :content, :date, :category_id, :feature_id, platform_ids: [])
          .merge(game_ids: gamearray)
    end

end

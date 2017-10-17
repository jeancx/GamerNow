class Admin::AdminController < ApplicationController
  check_authorization
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_advert, only: [:show, :edit, :update, :destroy]
  layout "administration"

  def index
    @posts = Post.where(status: "review").take(10);
    @posts_published = Post.where(status: "published").take(10);
  end

  private

end

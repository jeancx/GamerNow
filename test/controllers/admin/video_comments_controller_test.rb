require 'test_helper'

class Admin::VideoCommentsControllerTest < ActionController::TestCase
  setup do
    @video_comment = video_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:video_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create video_comment" do
    assert_difference('VideoComment.count') do
      post :create, video_comment: { content: @video_comment.content, user_id: @video_comment.user_id, video_id: @video_comment.video_id }
    end

    assert_redirected_to admin_video_comment_path(assigns(:video_comment))
  end

  test "should show video_comment" do
    get :show, id: @video_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @video_comment
    assert_response :success
  end

  test "should update video_comment" do
    patch :update, id: @video_comment, video_comment: { content: @video_comment.content, user_id: @video_comment.user_id, video_id: @video_comment.video_id }
    assert_redirected_to admin_video_comment_path(assigns(:video_comment))
  end

  test "should destroy video_comment" do
    assert_difference('VideoComment.count', -1) do
      delete :destroy, id: @video_comment
    end

    assert_redirected_to admin_video_comments_path
  end
end

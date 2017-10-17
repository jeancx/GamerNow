require 'test_helper'

class Admin::ImageCommentsControllerTest < ActionController::TestCase
  setup do
    @image_comment = image_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_comment" do
    assert_difference('ImageComment.count') do
      post :create, image_comment: { content: @image_comment.content, image_id: @image_comment.image_id, user_id: @image_comment.user_id }
    end

    assert_redirected_to admin_image_comment_path(assigns(:image_comment))
  end

  test "should show image_comment" do
    get :show, id: @image_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image_comment
    assert_response :success
  end

  test "should update image_comment" do
    patch :update, id: @image_comment, image_comment: { content: @image_comment.content, image_id: @image_comment.image_id, user_id: @image_comment.user_id }
    assert_redirected_to admin_image_comment_path(assigns(:image_comment))
  end

  test "should destroy image_comment" do
    assert_difference('ImageComment.count', -1) do
      delete :destroy, id: @image_comment
    end

    assert_redirected_to admin_image_comments_path
  end
end

require 'test_helper'

class Admin::GeneratesControllerTest < ActionController::TestCase
  setup do
    @generate = generates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:generates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create generate" do
    assert_difference('Generate.count') do
      post :create, generate: { Poll: @generate.Poll, model: @generate.model, slug: @generate.slug, status: @generate.status, title: @generate.title }
    end

    assert_redirected_to admin_generate_path(assigns(:generate))
  end

  test "should show generate" do
    get :show, id: @generate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @generate
    assert_response :success
  end

  test "should update generate" do
    patch :update, id: @generate, generate: { Poll: @generate.Poll, model: @generate.model, slug: @generate.slug, status: @generate.status, title: @generate.title }
    assert_redirected_to admin_generate_path(assigns(:generate))
  end

  test "should destroy generate" do
    assert_difference('Generate.count', -1) do
      delete :destroy, id: @generate
    end

    assert_redirected_to admin_generates_path
  end
end

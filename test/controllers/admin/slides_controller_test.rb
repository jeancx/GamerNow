require 'test_helper'

class Admin::SlidesControllerTest < ActionController::TestCase
  setup do
    @slide = slides(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slides)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slide" do
    assert_difference('Slide.count') do
      post :create, slide: { category: @slide.category, image: @slide.image, title: @slide.title }
    end

    assert_redirected_to admin_slide_path(assigns(:slide))
  end

  test "should show slide" do
    get :show, id: @slide
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @slide
    assert_response :success
  end

  test "should update slide" do
    patch :update, id: @slide, slide: { category: @slide.category, image: @slide.image, title: @slide.title }
    assert_redirected_to admin_slide_path(assigns(:slide))
  end

  test "should destroy slide" do
    assert_difference('Slide.count', -1) do
      delete :destroy, id: @slide
    end

    assert_redirected_to admin_slides_path
  end
end

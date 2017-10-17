require 'test_helper'

class Admin::AdvertsControllerTest < ActionController::TestCase
  setup do
    @advert = adverts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adverts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create advert" do
    assert_difference('Advert.count') do
      post :create, advert: { description: @advert.description, title: @advert.title }
    end

    assert_redirected_to admin_advert_path(assigns(:advert))
  end

  test "should show advert" do
    get :show, id: @advert
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @advert
    assert_response :success
  end

  test "should update advert" do
    patch :update, id: @advert, advert: { description: @advert.description, title: @advert.title }
    assert_redirected_to admin_advert_path(assigns(:advert))
  end

  test "should destroy advert" do
    assert_difference('Advert.count', -1) do
      delete :destroy, id: @advert
    end

    assert_redirected_to admin_adverts_path
  end
end

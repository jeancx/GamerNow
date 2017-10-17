require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { birthday: @user.birthday, cover: @user.cover, current_sign_in_ip: @user.current_sign_in_ip, description: @user.description, email: @user.email, encrypted_password: @user.encrypted_password, gender: @user.gender, last_sign_in_ip: @user.last_sign_in_ip, name: @user.name, photo: @user.photo }
    end

    assert_redirected_to admin_user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { birthday: @user.birthday, cover: @user.cover, current_sign_in_ip: @user.current_sign_in_ip, description: @user.description, email: @user.email, encrypted_password: @user.encrypted_password, gender: @user.gender, last_sign_in_ip: @user.last_sign_in_ip, name: @user.name, photo: @user.photo }
    assert_redirected_to admin_user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to admin_users_path
  end
end

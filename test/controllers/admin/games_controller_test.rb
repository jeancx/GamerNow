require 'test_helper'

class Admin::GamesControllerTest < ActionController::TestCase
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post :create, game: { content: @game.content, cover: @game.cover, date: @game.date, logo: @game.logo, mature: @game.mature, photo: @game.photo, status: @game.status, title: @game.title }
    end

    assert_redirected_to admin_game_path(assigns(:game))
  end

  test "should show game" do
    get :show, id: @game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game
    assert_response :success
  end

  test "should update game" do
    patch :update, id: @game, game: { content: @game.content, cover: @game.cover, date: @game.date, logo: @game.logo, mature: @game.mature, photo: @game.photo, status: @game.status, title: @game.title }
    assert_redirected_to admin_game_path(assigns(:game))
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete :destroy, id: @game
    end

    assert_redirected_to admin_games_path
  end
end

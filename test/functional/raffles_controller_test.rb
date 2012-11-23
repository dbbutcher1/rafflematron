require 'test_helper'

class RafflesControllerTest < ActionController::TestCase
  setup do
    @raffle = raffles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:raffles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create raffle" do
    assert_difference('Raffle.count') do
      post :create, raffle: { Name: @raffle.Name, Prize: @raffle.Prize, Start: @raffle.Start, end: @raffle.end }
    end

    assert_redirected_to raffle_path(assigns(:raffle))
  end

  test "should show raffle" do
    get :show, id: @raffle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @raffle
    assert_response :success
  end

  test "should update raffle" do
    put :update, id: @raffle, raffle: { Name: @raffle.Name, Prize: @raffle.Prize, Start: @raffle.Start, end: @raffle.end }
    assert_redirected_to raffle_path(assigns(:raffle))
  end

  test "should destroy raffle" do
    assert_difference('Raffle.count', -1) do
      delete :destroy, id: @raffle
    end

    assert_redirected_to raffles_path
  end
end

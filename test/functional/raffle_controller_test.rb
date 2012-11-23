require 'test_helper'

class RaffleControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

end

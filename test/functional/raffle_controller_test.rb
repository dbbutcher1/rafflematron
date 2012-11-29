require 'test_helper'

class RaffleControllerTest < ActionController::TestCase
  test "should get name" do
    get :name
    assert_response :success
  end

  test "should get type" do
    get :type
    assert_response :success
  end

end

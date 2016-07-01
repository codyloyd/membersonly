require 'test_helper'

class PostControllerTest < ActionController::TestCase
  test "should get text:string" do
    get :text:string
    assert_response :success
  end

end

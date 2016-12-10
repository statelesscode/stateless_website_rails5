require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get root to index" do
    get root_url
    assert_response :success
  end

end

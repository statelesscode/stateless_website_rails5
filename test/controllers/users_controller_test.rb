require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include SignInHelper  

  def setup
    @user = users(:author)
  end

  test 'should get show' do
    sign_in @user
    get user_url(@user)
    assert_response :success
    assert_select 'h1', "author123's Profile"
    assert_select 'dl dt', 8
    assert_select 'dl dd', 8
    assert_select 'dl dt', 'Username:'
    assert_select 'dl dd', 'author123'    
  end  

  test 'should patch email_subscribe' do
    user = users(:non_subscriber)
    sign_in user
    assert_equal false, user.email_subscriber
    patch email_subscribe_path(user)
    assert_redirected_to user_url(user) 
    assert_equal 'Thank you for joining the Stateless Code email distibution!', flash[:notice]
  end

end

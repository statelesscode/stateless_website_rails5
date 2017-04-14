require 'test_helper'

class DeviseControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include SignInHelper

  def setup
    @user = users(:author)
  end

  test 'should get new user session' do
    get new_user_session_url
    assert_response :success  
  end

  test 'should sign in user' do
    assert_no_difference('User.find(@user.id).failed_attempts') do
      post user_session_url, params: {email: @user.email, password: 'justaguy12345678'}
    end
    assert_response :success
  end

  test 'should not sign in user with bad credentials' do
    skip
    assert_difference('@user.failed_attempts') do    
      post user_session_url, params: {email: @user.email, password: 'bustaguy12345678'}
    end
    assert_response :success
  end

  test 'should sign out user' do
    sign_in @user
    delete destroy_user_session_url, params: {user: @user}
    assert_redirected_to root_url
  end
#            user_session POST   /users/sign_in(.:format)                          devise/sessions#create
#    destroy_user_session DELETE /users/sign_out(.:format)                         devise/sessions#destroy
#       new_user_password GET    /users/password/new(.:format)                     devise/passwords#new
#      edit_user_password GET    /users/password/edit(.:format)                    devise/passwords#edit
#           user_password PATCH  /users/password(.:format)                         devise/passwords#update
#                         PUT    /users/password(.:format)                         devise/passwords#update
#                         POST   /users/password(.:format)                         devise/passwords#create
#cancel_user_registration GET    /users/cancel(.:format)                           devise/registrations#cancel
#   new_user_registration GET    /users/sign_up(.:format)                          devise/registrations#new
#  edit_user_registration GET    /users/edit(.:format)                             devise/registrations#edit
#       user_registration PATCH  /users(.:format)                                  devise/registrations#update
#                         PUT    /users(.:format)                                  devise/registrations#update
#                         DELETE /users(.:format)                                  devise/registrations#destroy
#                         POST   /users(.:format)                                  devise/registrations#create
#   new_user_confirmation GET    /users/confirmation/new(.:format)                 devise/confirmations#new
#       user_confirmation GET    /users/confirmation(.:format)                     devise/confirmations#show
#                         POST   /users/confirmation(.:format)                     devise/confirmations#create
#         new_user_unlock GET    /users/unlock/new(.:format)                       devise/unlocks#new
#             user_unlock GET    /users/unlock(.:format)                           devise/unlocks#show
#                         POST   /users/unlock(.:format)                           devise/unlocks#create



end

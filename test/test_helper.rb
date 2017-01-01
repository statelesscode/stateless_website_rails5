ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

module SignInHelper
  def login(who)
   open_session do |sess|
     #sess.extend(CustomAssertions)
     sess.post user_session_url, params: { email: who.email,
       password: who.password }
   end
  end    
  def sign_in_as(user)
    return_val = post user_session_url(params: {
      session: {
        email: user.email,
        password: user.password
      }
    })
    puts return_val
    return_val
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

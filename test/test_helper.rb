ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'capybara/minitest'

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

class CapybaraIntegrationTest < ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
  # Make `assert_*` methods behave like Minitest assertions
  include Capybara::Minitest::Assertions

  # Reset sessions and driver between tests
  # Use super wherever this method is redefined in your individual test classes
  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

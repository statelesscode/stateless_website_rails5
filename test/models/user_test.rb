require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:public)
  end
  # Hooks

  # Constants
  
  # Active Record Relationships

  # Validations
  test 'should validate role' do
    @user.role = 'Inventor of the Question Mark'
    assert_not @user.save
    assert_includes @user.errors.full_messages, "Role is not included in the list"    
  end

  test 'should validate subscription_class' do
    @user.subscription_class = 'Owner of Mars'
    assert_not @user.save
    assert_includes @user.errors.full_messages, "Subscription class is not included in the list"    
  end

  test 'should validate user_class' do
    @user.user_class = 'King'
    assert_not @user.save
    assert_includes @user.errors.full_messages, "User class is not included in the list"    
  end


  # Scopes 

  # Class Methods
  test 'self.roles returns expected value' do
    assert_equal ['Admin', 'Moderator', 'Author', 'Subscriber', 'Public'], User.roles
  end

  test 'self.subscription_classes returns expected value' do
    assert_equal ['Master', 'Active', 'Expired', 'Email', 'Public'], User.subscription_classes
  end

  test 'self.user_classes returns expected value' do
    assert_equal ['Staff', 'Legend', 'Elite User', 'Extreme User', 'Power User', 'User', 'Guest'], User.user_classes
  end

  
  # Public Instance Methods
  test 'is_admin? method returns expected value' do
    assert_equal false, @user.is_admin?     
    assert_equal true, users(:admin).is_admin? 
  end   

  # Protected Instance Methods

  # Private Instance Methods  
end

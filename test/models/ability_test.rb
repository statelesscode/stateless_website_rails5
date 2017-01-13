require 'test_helper'

class AbilityTest < ActiveSupport::TestCase
  test "Admin can do anything" do
    user = users(:admin)
    ability = Ability.new(user)
    assert ability.can?(:manage, Article.new)
    assert ability.can?(:manage, Comment.new)
    assert ability.can?(:manage, User.new)
  end  

  test "Moderator has appropriate access" do
    user = users(:moderator)
    ability = Ability.new(user)
    assert ability.can?(:manage, Comment.new)
    assert ability.can?(:read, Article.new)
    assert ability.can?(:create, Article.new)
    assert ability.can?(:update, Article.new(author: user))
    assert ability.cannot?(:update, Article.new)    
    assert ability.can?(:destroy, Article.new(author: user))
    assert ability.cannot?(:destroy, Article.new)
    assert ability.can?(:read, User.new)
    assert ability.can?(:update, User.new)    
    assert ability.can?(:destroy, User.new)
  end  

  test "Author has appropriate access" do
    user = users(:author)
    ability = Ability.new(user)
    assert ability.can?(:read, Comment.new)
    assert ability.cannot?(:update, Comment.new)    
    assert ability.can?(:update, Comment.new(commenter: user))
    assert ability.cannot?(:destroy, Comment.new)    
    assert ability.can?(:destroy, Comment.new(commenter: user))    
    assert ability.can?(:read, Article.new)
    assert ability.can?(:create, Article.new)
    assert ability.can?(:update, Article.new(author: user))
    assert ability.cannot?(:update, Article.new)    
    assert ability.can?(:destroy, Article.new(author: user))
    assert ability.cannot?(:destroy, Article.new)
    assert ability.can?(:read, User.new)
    assert ability.cannot?(:update, User.new)
    assert ability.can?(:update, user)    
    assert ability.cannot?(:destroy, User.new)
  end  

  test "Subscriber has appropriate access" do
    user = users(:krugman)
    ability = Ability.new(user)
    assert ability.can?(:read, Comment.new)
    assert ability.cannot?(:update, Comment.new)    
    assert ability.can?(:update, Comment.new(commenter: user))
    assert ability.cannot?(:destroy, Comment.new)    
    assert ability.can?(:destroy, Comment.new(commenter: user))    
    assert ability.can?(:read, Article.new)
    assert ability.cannot?(:create, Article.new)
    assert ability.cannot?(:update, Article.new(author: user))
    assert ability.cannot?(:update, Article.new)    
    assert ability.cannot?(:destroy, Article.new(author: user))
    assert ability.cannot?(:destroy, Article.new)
    assert ability.can?(:read, User.new)
    assert ability.cannot?(:update, User.new)
    assert ability.can?(:update, user)    
    assert ability.cannot?(:destroy, User.new)
  end  

  test "Public has appropriate access" do
    user = users(:public)
    ability = Ability.new(user)
    assert ability.can?(:read, Comment.new)
    assert ability.cannot?(:update, Comment.new)    
    assert ability.cannot?(:update, Comment.new(commenter: user))
    assert ability.cannot?(:destroy, Comment.new)    
    assert ability.cannot?(:destroy, Comment.new(commenter: user))    
    assert ability.can?(:read, Article.new)
    assert ability.cannot?(:create, Article.new)
    assert ability.cannot?(:update, Article.new(author: user))
    assert ability.cannot?(:update, Article.new)    
    assert ability.cannot?(:destroy, Article.new(author: user))
    assert ability.cannot?(:destroy, Article.new)
    assert ability.cannot?(:read, User.new)
    assert ability.cannot?(:email_subscribe, User.new)
    assert ability.can?(:email_subscribe, user)
    assert ability.cannot?(:update, User.new)
    assert ability.cannot?(:update, user)    
    assert ability.cannot?(:destroy, User.new)
  end  

  test "Guest has appropriate access" do    
    ability = Ability.new(nil)
    assert ability.can?(:read, Comment.new)
    assert ability.cannot?(:update, Comment.new)    
    assert ability.cannot?(:destroy, Comment.new)    
    assert ability.can?(:read, Article.new)
    assert ability.cannot?(:create, Article.new)
    assert ability.cannot?(:update, Article.new)    
    assert ability.cannot?(:destroy, Article.new)
    assert ability.cannot?(:read, User.new)
    assert ability.cannot?(:update, User.new)
    assert ability.cannot?(:destroy, User.new)
  end  


end
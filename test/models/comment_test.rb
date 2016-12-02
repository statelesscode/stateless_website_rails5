require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @comment = comments(:one)
  end
  
  test 'should be valid with title and text' do
    assert comments(:one).save
  end

  test 'should be invalid without commenter' do
    comment = Comment.new(body: 'No commenter', article: articles(:one))
    assert_not comment.save
    assert_includes comment.errors.full_messages, "Commenter can't be blank"
  end

  test 'should be invalid without body' do
    comment = Comment.new(commenter: 'No body (Get it?)', article: articles(:one))
    assert_not comment.save
    assert_includes comment.errors.full_messages, "Body can't be blank"
  end

  test 'should be invalid without article' do
    comment = Comment.new(commenter: 'Orphan', body: 'No article.')
    assert_not comment.save
    assert_includes comment.errors.full_messages, "Article must exist"
  end


  test 'commenter should have a minimum length of 1' do
    @comment.commenter = ''
    assert_not @comment.save
    assert_includes @comment.errors.full_messages, 
      "Commenter is too short (minimum is 1 character)"    
  end

  test 'commenter should have a maximum length of 255' do
    @comment.commenter = 'q' * 256
    assert_not @comment.save
    assert_includes @comment.errors.full_messages, 
      "Commenter is too long (maximum is 255 characters)"    
  end

end

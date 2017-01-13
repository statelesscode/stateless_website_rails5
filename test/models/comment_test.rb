require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @comment = comments(:health)
  end
  
  test 'should be valid with title and body' do
    assert comments(:cretin).save
  end

  test 'should be valid without commenter' do
    comment = Comment.new(body: 'No commenter', commentable: articles(:one))
    assert comment.save
  end

  test 'should be invalid without body' do
    comment = Comment.new(commenter: users(:author), commentable: articles(:one))
    assert_not comment.save
    assert_includes comment.errors.full_messages, "Body can't be blank"
  end

  test 'should be invalid without commentable' do
    comment = Comment.new(commenter: users(:krugman), body: 'No commentable.')
    assert_not comment.save
    assert_includes comment.errors.full_messages, "Commentable can't be blank"
  end

  test 'can add child' do
    comment = comments(:health)
    child_comment = comment.add_child(Comment.new(commentable: articles(:one), commenter: users(:author), body: 'Add a child.'))
    assert_equal child_comment.parent_id, comment.id
    assert_includes comment.children, child_comment
  end

end

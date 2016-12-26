require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include SignInHelper

  def setup
    @article = articles(:one)
    @user = users(:public)

  end

  test 'should create comment' do
    assert_difference('Comment.count') do
      sign_in users(:krugman)
      post article_comments_path(@article), params: {comment:  
        {body: "Break a window!", article: @article}}
    end
    assert_redirected_to article_path(@article)
    assert_equal 'Comment was successfully created.', flash[:notice]
  end

  test 'should destroy comment' do
    assert_difference('Comment.count', -1) do
      sign_in @user
      delete article_comment_path(@article, @article.comments.last), params: {id: @article.comments.last}
    end
    assert_redirected_to article_path(@article)
    assert_equal 'Comment was successfully destroyed.', flash[:notice]
  end

  test 'should not delete destroy if unauthorized' do
    delete article_comment_path(@article, @article.comments.last), params: {id: @article.comments.last}
    assert_redirected_to new_user_session_path
  end

end

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include SignInHelper

  def setup
    @article = articles(:one)
    @comment = comments(:one)
    @user = users(:public)

  end

  test 'should get index' do
    sign_in @user
    get comments_url
    assert_response :success
    assert_select 'h1', 'Stateless Code Comments'
    assert_select 'tr', Comment.all.count + 1    
  end

  test 'should get show' do
    sign_in @user
    get comment_url(@comment)
    assert_response :success
  end

  test 'should get edit' do
    sign_in @user
    get edit_comment_url(@comment)
    assert_response :success
    assert_select 'h1', 'Edit Comment'
    assert_select 'form'
    assert_select 'form p', 2    
  end

  test 'should create comment from articles nested path' do
    assert_difference('Comment.count') do
      sign_in users(:krugman)
      post article_comments_path(@article), params: {comment:  
        {body: "Break a window!", article: @article}}
    end
    assert_redirected_to article_path(@article)
    assert_equal 'Comment was successfully created.', flash[:notice]
  end

  test 'should update comment' do
    sign_in @user
    patch comment_url(@comment), params: {id: @comment.id, comment: {body: 'I am updated!'}}
    assert_redirected_to comment_path(@comment)
    assert_equal 'Comment was successfully updated.', flash[:notice]
  end

  test 'should destroy comment from articles nested path' do
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

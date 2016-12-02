require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @article = articles(:one)
  end

  test 'should create comment' do
    assert_difference('Comment.count') do
      post article_comments_path(@article), params: {comment: {commenter: 'Krugman', 
        body: "Break a window!", article: @article}}
    end
    assert_redirected_to article_path(@article)
    assert_equal 'Comment was successfully created.', flash[:notice]
  end

  test 'should destroy comment' do
    assert_difference('Comment.count', -1) do
      delete article_comment_path(@article, @article.comments.last), params: {id: @article.comments.last}
    end
    assert_redirected_to article_path(@article)
    assert_equal 'Comment was successfully destroyed.', flash[:notice]
  end

end

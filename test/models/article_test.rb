require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @article = articles(:one)
  end
  test 'should be valid with title and text' do
    assert articles(:one).save
  end

  test 'should be invalid without title' do
    article = Article.new(text: 'No title')
    assert_not article.save
    assert_includes article.errors.full_messages, "Title can't be blank"
  end

  test 'should be invalid without text' do
    article = Article.new(title: 'No body')
    assert_not article.save
    assert_includes article.errors.full_messages, "Text can't be blank"
  end

  test 'title should have a minimum length of 3' do
    @article.title = 'qq'
    assert_not @article.save
    assert_includes @article.errors.full_messages, 
      "Title is too short (minimum is 3 characters)"    
  end

  test 'title should have a maximum length of 255' do
    @article.title = 'q' * 256
    assert_not @article.save
    assert_includes @article.errors.full_messages, 
      "Title is too long (maximum is 255 characters)"    
  end

end

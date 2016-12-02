require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @article = articles(:one)
  end

  test 'should get index' do
    get articles_url
    assert_response :success
    assert_select 'h1', 'Stateless Code Articles'
    assert_select 'tr', Article.all.count + 1
  end

  test 'should get show' do
    @article.save!
    get article_url(@article)
    assert_response :success
    assert_select 'h1', @article.title
    assert_select 'p', @article.text
  end

  test 'should get new' do
    get new_article_url
    assert_response :success
    assert_select 'h1', 'New Article'
    assert_select 'form'
    assert_select 'form p', 3    
  end

  test 'should get edit' do
    get edit_article_url(@article)
    assert_response :success
    assert_select 'h1', 'Edit Article'
    assert_select 'form'
    assert_select 'form p', 3    
  end  

  test 'should create article' do
    assert_difference('Article.count') do
      post articles_url, params: {article: {title: 'I am an article', 
        text: "I'm asleep: #{'z'*1000}"}}
    end
    assert_redirected_to article_path(Article.last)
    assert_equal 'Article was successfully created.', flash[:notice]
  end

  test 'should handle bad create params properly' do
    assert_no_difference('Article.count') do
      post articles_url, params: {article: { text: "I'm asleep: #{'z'*1000}"}}
    end
    assert_select 'li', 'Title can\'t be blank'    
  end

  test 'should update article' do
    patch article_url(@article), params: {id: @article.id, article: {title: 'I am updated'}}
    assert_redirected_to article_path(@article)
    assert_equal 'Article was successfully updated.', flash[:notice]
  end

  test 'should handle bad update params properly' do
    patch article_url(@article), params: {id: @article.id, article: { title: 'qq'}}
    assert_select 'li', 'Title is too short (minimum is 3 characters)'    
  end

  test 'should destroy article' do
    assert_difference('Article.count', -1) do
      delete article_path(Article.last), params: {id: Article.last.id}
    end
    assert_redirected_to articles_path
    assert_equal 'Article was successfully destroyed.', flash[:notice]
  end

end

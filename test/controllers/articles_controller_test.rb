require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include SignInHelper

  def setup
    @article = articles(:one)
    @user = users(:author)
  end

  test 'should get index' do
    sign_in @user
    get articles_url
    assert_response :success
    assert_select 'meta', name: 'description', content: 'From Ruby to Bitcoin to the Non-Aggression Principle to nullification, the Stateless Code Blog will make the time you spend here worth the opportunity cost.'
    assert_select 'title', 'Stateless Code Blog'  
    assert_select '#articlesIndexTitle', 'Stateless Code Blog'
    assert_select '.stateless-article-partial-card', Article.all.count
  end

  test 'should get show' do
    sign_in @user
    @article.save!
    get article_url(@article)
    assert_response :success
    assert_select 'h1', @article.title
    assert_select 'p', @article.body
  end

  test 'should get new' do
    sign_in @user
    get new_article_url
    assert_response :success
    assert_select 'meta', name: 'description', content: 'The page to add a new blog post for Stateless Code.'
    assert_select 'title', 'Add a new Stateless blog post'  
    assert_select '#articlesNewTitle', 'Add a new Stateless blog post'
    assert_select 'form'
    assert_select 'form div', 22    
  end

  test 'should not get new if unauthorized' do
    get new_article_url
    assert_redirected_to new_user_session_path
  end  

  test 'should get edit' do
    sign_in @user
    get edit_article_url(@article)
    assert_response :success
    assert_select 'meta', name: 'description', content: "Edit #{@article.title}. #{@article.description}"
    assert_select 'title', "Edit #{@article.title}"  
    assert_select '#articlesEditTitle', "Edit #{@article.title}"
    assert_select 'form'
    assert_select 'form div', 22    
  end  

  test 'should not get edit if unauthorized' do
    get edit_article_url(@article)
    assert_redirected_to new_user_session_path
  end

  test 'should create article' do
    sign_in @user
    assert_difference('Article.count') do
      post articles_url, params: {article: {title: 'I am an article', 
        body: "I'm asleep: #{'z'*1000}", status: 'Draft'}}
    end
    assert_redirected_to article_path(Article.last)
    assert_equal 'Article was successfully created.', flash[:notice]
  end

  test 'should handle bad create params properly' do
    sign_in @user
    assert_no_difference('Article.count') do
      post articles_url, params: {article: { body: "I'm asleep: #{'z'*1000}"}}
    end
    assert_select 'li', 'Title can\'t be blank'    
  end

  test 'should not post create if unauthorized' do
    post articles_url, params: {article: {title: 'I am an article', 
        body: "I'm asleep: #{'z'*1000}"}}
    assert_redirected_to new_user_session_path
  end

  test 'should update article' do
    sign_in @user
    patch article_url(@article), params: {id: @article.id, article: {title: 'I am updated'}}
    assert_redirected_to article_path(@article)
    assert_equal 'Article was successfully updated.', flash[:notice]
  end

  test 'should handle bad update params properly' do
    sign_in @user
    patch article_url(@article), params: {id: @article.id, article: { title: 'qq'}}
    assert_select 'li', 'Title is too short (minimum is 3 characters)'    
  end

  test 'should not patch update if unauthorized' do
    patch article_url(@article), params: {id: @article.id, article: { title: 'qq'}}
    assert_redirected_to new_user_session_path
  end

  test 'should destroy article' do
    sign_in @user
    assert_difference('Article.count', -1) do
      delete article_path(Article.last), params: {id: Article.last.id}
    end
    assert_redirected_to articles_path
    assert_equal 'Article was successfully destroyed.', flash[:notice]
  end

  test 'should not delete destroy if unauthorized' do
    delete article_path(Article.last), params: {id: Article.last.id}
    assert_redirected_to new_user_session_path
  end

end

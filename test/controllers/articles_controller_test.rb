require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get articles_url
    assert_response :success
    assert_select 'h1', 'Articles#index'
  end

  test 'should get new' do
    get new_article_url
    assert_response :success
    assert_select 'h1', 'New Article'
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

end

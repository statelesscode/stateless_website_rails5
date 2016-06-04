require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articles_url
    assert_response :success
    assert_select 'h1', 'Articles#index'
  end

  test "should get new" do
    get new_article_url
    assert_response :success
    assert_select 'h1', 'New Article'
  end
end

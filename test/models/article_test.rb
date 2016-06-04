require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @article = articles(:one)
  end
  test 'should be valid with title and text' do
    assert articles(:one).save
  end

  test 'should be invalid without title' do
    assert_not Article.new(text: 'No title').save
  end

  test 'should be invalid without text' do
    assert_not Article.new(title: 'No body').save
  end


end

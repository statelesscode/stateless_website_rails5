require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @article = articles(:one)
  end

  # Constants
  test 'STATUSES constant has expected values' do
    assert_equal ['Draft', 'Premium', 'Public'], Article::STATUSES 
  end

  # Validations
  test 'should be valid with title and body' do
    @article.validate
    puts @article.errors.full_messages
    assert articles(:one).save
  end

  test 'should be invalid without title' do
    article = Article.new(body: 'No title')
    assert_not article.save
    assert_includes article.errors.full_messages, "Title can't be blank"
  end

  test 'should be invalid without body' do
    article = Article.new(title: 'No body')
    assert_not article.save
    assert_includes article.errors.full_messages, "Body can't be blank"
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

  test 'description should have a maximum length of 150' do
    @article.description = 'q' * 151
    assert_not @article.save
    assert_includes @article.errors.full_messages, 
      "Description is too long (maximum is 150 characters)"    
  end

  test 'should be invalid without status' do
    article = Article.new(title: 'No status')
    assert_not article.save
    assert_includes article.errors.full_messages, "Status can't be blank"    
  end

  test 'status should be included in STATUSES constant' do
    article = Article.new(title: 'No status', status: 'Redacted')
    assert_not article.save
    assert_includes article.errors.full_messages, "Status is not included in the list"    
  end

  # Class Methods

  # this will change if you add a new fixture with a different topic
  test 'existing_topics method should contain all existing Article topics' do
    assert_equal Article.existing_topics, ['Libertarianism', 'Ruby on Rails']
  end

  # Instance Methods

  test 'published? method returns expected value' do
    @article.update(status: 'Draft')
    assert_equal false, @article.published?     
    @article.update(status: 'Premium')
    assert_equal true, @article.published? 
    @article.update(status: 'Public')
    assert_equal true, @article.published? 
    assert_equal false, Article.new.published?
  end

  test 'truncate_body method returns expected value' do
    assert_equal @article.body, @article.truncate_body
    @article.update(body: "#{'Z' * 2000}")
    assert_equal "#{@article.body[0...1500]}...", @article.truncate_body
  end

end

class Article < ApplicationRecord
  # Constants
  STATUSES = ['Draft', 'Premium', 'Public']
  TRUNCATION_LENGTH = 1500

  # Active Record Relationships
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :author, class_name: 'User', foreign_key: 'author_user_id'

  # Serialized Attributes
  serialize :keywords, Array

  # Hooks
  before_save :filter_and_sort_keywords

  # Validations
  validates :title, presence: true, length: {minimum: 3, maximum: 255}
  validates :body, presence: true
  validates :description, length: {maximum: 150}
  validates :status, presence: true, inclusion: {in: STATUSES}

  # Class Methods  
  def self.existing_topics
    Article.pluck(:topic).reject{|el| el.nil?}.sort.uniq
  end

  # Public Instance Methods
  def published?
    if self.status == 'Premium' || self.status == 'Public'
      true
    else
      false
    end
  end

  # Truncate body to 500 characters if appplicable
  def truncate_body
    if self.body.length > TRUNCATION_LENGTH
      "#{self.body[0...TRUNCATION_LENGTH]}..."    
    else
      self.body
    end  
  end

  private
  def filter_and_sort_keywords
    self.keywords = self.keywords.reject{|el| el.blank?}.sort
  end
end

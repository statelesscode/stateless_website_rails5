class Article < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :author, class_name: 'User', foreign_key: 'author_user_id'
  validates :title, presence: true, length: {minimum: 3, maximum: 255}
  validates :body, presence: true

end

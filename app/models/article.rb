class Article < ApplicationRecord

  validates :title, presence: true, length: {minimum: 3, maximum: 255}
  validates :text, presence: true

end

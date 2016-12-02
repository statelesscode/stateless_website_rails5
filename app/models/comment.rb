class Comment < ApplicationRecord
  belongs_to :article

  validates :commenter, presence: true, length: {minimum: 1, maximum: 255}
  validates :body, presence: true

end

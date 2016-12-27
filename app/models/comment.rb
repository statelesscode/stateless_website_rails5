class Comment < ApplicationRecord
  # Constants
  
  # Active Record Relationships
  belongs_to :commentable, polymorphic: :true
  has_many :comments, as: :commentable
  belongs_to :commenter, class_name: 'User', foreign_key: 'commenter_user_id' 

  # Validations
  validates :body, presence: true

  # Scopes 

  # Class Methods
  
  # Public Instance Methods

  # Protected Instance Methods

  # Private Instance Methods  

end

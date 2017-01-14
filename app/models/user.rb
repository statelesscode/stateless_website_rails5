class User < ApplicationRecord

  # Devise
  # Include default devise modules. Others available are:
  # :omniauthable add later
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable


  # Hooks

  # Constants
 
  # Active Record Relationships
  has_many :comments, class_name: 'Comment', foreign_key: 'commenter_user_id', dependent: :nullify
  has_many :articles, class_name: 'Article', foreign_key: 'author_user_id', dependent: :nullify
  has_attached_file :avatar, styles: { medium: "400x400>", small: "100x100>", thumb: "32x32>" }, default_url: "/images/:style/missing.png"
  


  # Scopes 

  # Class Methods
  def self.roles
    ['Admin', 'Moderator', 'Author', 'Subscriber', 'Public']
  end

  def self.subscription_classes
    ['Master', 'Active', 'Expired', 'Email', 'Public']
  end

  def self.user_classes
    ['Staff', 'Legend', 'Elite User', 'Extreme User', 'Power User', 'User', 'Guest']
  end

  # Validations
  validates_attachment :avatar, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }, allow_nil: true, allow_blank: true
  validates_with AttachmentPresenceValidator, attributes: :avatar, allow_nil: true, allow_blank: true
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 500.kilobytes 
  validates :role, inclusion: {in: User.roles} 
  validates :role, inclusion: {in: User.roles} 
  validates :subscription_class, inclusion: {in: User.subscription_classes}
  validates :user_class, inclusion: {in: User.user_classes} 


  # Public Instance Methods
  def is_admin?
    self.role == 'Admin' ? true : false
  end
  # Protected Instance Methods

  # Private Instance Methods


end

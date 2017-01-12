class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable add later
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable
  has_many :comments, class_name: 'Comment', foreign_key: 'commenter_user_id', dependent: :nullify
  has_many :articles, class_name: 'Article', foreign_key: 'author_user_id', dependent: :nullify
  has_attached_file :avatar, styles: { medium: "400x400>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment :avatar, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }, allow_nil: true, allow_blank: true
  validates_with AttachmentPresenceValidator, attributes: :avatar, allow_nil: true, allow_blank: true
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes    
end

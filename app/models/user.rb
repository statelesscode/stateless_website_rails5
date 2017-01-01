class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable add later
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable
  has_many :comments, class_name: 'Comment', foreign_key: 'commenter_user_id', dependent: :nullify
  has_many :articles, class_name: 'Article', foreign_key: 'author_user_id', dependent: :nullify
  
end

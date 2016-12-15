class Post < ApplicationRecord
  include Commentable

  # belongs_to :author, class_name: "User"
  belongs_to :user

  validates :body, length: {minimum: 1}


  has_many :likes, dependent: :destroy
  has_many :user_likes, through: :likes, source: :user

  # has_many :comments, as: :commentable
end

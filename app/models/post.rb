class Post < ApplicationRecord
  include Commentable

  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :user_likes, through: :likes, source: :user

  # has_many :comments, as: :commentable
end

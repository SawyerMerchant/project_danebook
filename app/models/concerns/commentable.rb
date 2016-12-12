module Commentable
  extend ActiveSupport::Concern

  # 1. Code to run atop each model
  included do
    has_many :comments, as: :commentable
    # ... associations, validations, etc...
  end

  # 2. Class methods
  module ClassMethods
    def least_commented
      # returns the article/event which has the
      # least number of comments
    end
  end

  # 3. Instance methods
  def find_first_comment
    comments.first(created_at DESC)
  end

end

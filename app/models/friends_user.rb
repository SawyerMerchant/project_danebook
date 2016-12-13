class FriendsUser < ApplicationRecord
  belongs_to :user
  belongs_to :frinend, class_name: :users
end

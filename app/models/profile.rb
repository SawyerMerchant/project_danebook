class Profile < ApplicationRecord
  belongs_to :user, inverse_of: :profile

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    self.first_name + ' ' + self.last_name
  end

end

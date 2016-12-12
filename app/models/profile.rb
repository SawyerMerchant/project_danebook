class Profile < ApplicationRecord
  belongs_to :user, inverse_of: :profile

  def full_name
    self.first_name + ' ' + self.last_name
  end

end

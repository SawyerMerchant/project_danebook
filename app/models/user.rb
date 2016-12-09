class User < ApplicationRecord

  before_create :generate_token

  has_one :profile, inverse_of: :user
  accepts_nested_attributes_for :profile

  has_secure_password
  validates :password, length: {minimum: 8}, allow_nil: true

  def generate_token
    begin
      self.auth_token = SecureRandom.urlsafe_base64
    end while User.exists?(:auth_token => self[:auth_token])
  end

  def regenerate_auth_token
    self.auth_token = nil
    self.generate_token
    self.save!
  end

end

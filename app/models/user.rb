class User < ApplicationRecord
  default_scope {includes :profile}
  before_create :generate_token
  before_save :format_input

  validates :email, presence: true, uniqueness: true, case_sensitive: false

  has_one :profile, inverse_of: :user, dependent: :destroy
  accepts_nested_attributes_for :profile

  has_secure_password
  validates :password, length: {minimum: 8}, allow_nil: true

  has_many :posts, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  has_many :comments, dependent: :destroy

  has_many :friends_users
  has_many :friends, through: :friends_users, source: :user

  has_many :photos, dependent: :destroy



  def regenerate_auth_token
    self.auth_token = nil
    generate_token
    save!
  end

  private

  def generate_token
    begin
      self.auth_token = SecureRandom.urlsafe_base64
    end while User.exists?(:auth_token => self[:auth_token])
  end

    def format_input
      email.downcase!
    end

end

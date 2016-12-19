class Profile < ApplicationRecord
  belongs_to :user, inverse_of: :profile

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def full_name
    self.first_name + ' ' + self.last_name
  end

end

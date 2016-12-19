class Photo < ApplicationRecord
  belongs_to :user

  has_attached_file :photo_file, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_file, content_type: /\Aimage\/.*\z/
end

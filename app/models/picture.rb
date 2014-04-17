class Picture < ActiveRecord::Base
  belongs_to :property

  has_attached_file :image, :styles => { small: "100x100>", medium: "250x250#", large: "640x420#" }

  validates_attachment_content_type :image, :content_type =>
  ["image/jpg", "image/jpeg", "image/png"]

  validates :image, presence: true
end

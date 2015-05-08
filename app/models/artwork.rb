class Artwork < ActiveRecord::Base
  acts_as_votable
  belongs_to :artist
  has_many :comments
  has_attached_file :image, styles: { medium: "700x500>", small: "350x250>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :title, :description, presence: true,
            length: {minimum: 5}
end

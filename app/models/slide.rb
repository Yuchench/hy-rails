class Slide < ActiveRecord::Base
  has_attached_file :slideimage, styles: {
    thumb: '100x100#',
    square: '200x200#',
    medium: '1920x630>'
  }
  validates :caption, presence: true
  validates :slideimage, :attachment_presence => true
  validates_attachment_content_type :slideimage, :content_type => /\Aimage\/.*\Z/
end

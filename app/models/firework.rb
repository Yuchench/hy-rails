class Firework < ActiveRecord::Base
	scope :all_type, ->(type) { where("product_type = ?", type) }
	has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '600x600>'
  }

  # Validate the attached image is image/jpg, image/png, etc
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end

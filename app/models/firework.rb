class Firework < ActiveRecord::Base
  scope :all_type, ->(type) { where("product_type = ?", type) }
  has_attached_file :image, styles: {
    thumb: '100x100#',
    square: '200x200#',
    medium: '600x600>'
  }
  def self.search(search)
    if search
      find(:all, :conditions => ['lower(name) LIKE ? OR lower(name_id) LIKE ?',"%#{search.downcase}%","%#{search.downcase}%"])
    else
      find(:all)
    end
  end
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :youtube_url, presence: true
  validates :image, presence: true
  validates :name, presence: true
  validates :name_id, presence: true
  validates :product_type,presence: true
end

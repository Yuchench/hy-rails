class Firework < ActiveRecord::Base
  default_scope order(:code)
  scope :all_type, ->(type) { where("product_type = ?", type) }
  scope :sub_type, ->(sub_type) { where("sub_type = ?", sub_type) }
  has_attached_file :image, styles: {
    thumb: '100x100#',
    square: '200x200#',
    medium: '2000x2000>'
  }
  def self.product_sub_type
    {'真假火焰類' => 'fake', '啟動魔球類' => 'ball','啟動台類' => 'site','其他道具類' => 'other'}
  end
  def self.product_types
    {'舞台煙火 Stage Pyro' => 'stage' ,'升空煙火 Fireworks' => 'air' ,'特殊煙火 Special Pyro' => 'special' ,'鋼瓶發射類 Cylinder' => 'project' ,'道具類 Stage Props' => 'gadge' ,'機械式 Mechanical' => 'mech' ,'特殊效果 Special Effect' => 'effect' }
  end
  def self.sub_type_codes
    {'fake' => 1, 'ball' => 2,'site' => 3,'other' => 4}
  end
  def self.type_codes
    {'stage' => 1 ,'air' =>2 ,'special' => 3,'project' =>4,'gadge' => 5,'mech' =>6 ,'effect' => 7 }
  end
  def self.search(search)
    if search
      find(:all, :conditions => ['lower(name) LIKE ? OR lower(name_id) LIKE ? OR lower(content) LIKE ?',"%#{search.downcase}%","%#{search.downcase}%","%#{search.downcase}%"])
    else
      find(:all)
    end
  end
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :youtube_url, presence: true
  validates :image, presence: true
  validates :name, presence: true
  validates :code, presence: true
  validates :product_type,presence: true
end

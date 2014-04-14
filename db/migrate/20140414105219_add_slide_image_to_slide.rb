class AddSlideImageToSlide < ActiveRecord::Migration
  def self.up
    add_attachment :slides, :slideimage
  end

  def self.down
    remove_attachment :slides, :slideimage
  end
end

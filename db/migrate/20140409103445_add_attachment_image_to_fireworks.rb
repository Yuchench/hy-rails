class AddAttachmentImageToFireworks < ActiveRecord::Migration
  def self.up
    change_table :fireworks do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :fireworks, :image
  end
end

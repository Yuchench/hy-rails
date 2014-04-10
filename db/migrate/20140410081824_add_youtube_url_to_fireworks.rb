class AddYoutubeUrlToFireworks < ActiveRecord::Migration
  def change
    add_column :fireworks, :youtube_url, :string
  end
end

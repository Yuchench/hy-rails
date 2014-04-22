class AddCodeToFirework < ActiveRecord::Migration
  def up
    add_column :fireworks, :code, :integer, :null => false, :default => 0
  end

  def down
    remove_column :fireworks, :code
  end
end

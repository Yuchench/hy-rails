class AddSubTypeToFirework < ActiveRecord::Migration
  def change
    add_column :fireworks, :sub_type, :string
  end
end

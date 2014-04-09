class CreateFireworks < ActiveRecord::Migration
  def change
    create_table :fireworks do |t|
      t.string :name_id
      t.string :name
      t.string :product_type
      t.string :content

      t.timestamps
    end
  end
end

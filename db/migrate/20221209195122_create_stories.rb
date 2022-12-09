class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :caption
      t.text :story
      t.integer :owner_id
      t.string :location
      t.string :image
      t.integer :likes_count
      t.integer :comments_count

      t.timestamps
    end
  end
end

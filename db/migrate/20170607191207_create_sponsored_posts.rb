class CreateSponsoredPosts < ActiveRecord::Migration
  def change
    create_table :sponsored_posts do |t|
      t.string :title
      t.text :body
      t.integer :price

      t.timestamps null: false
    end
  end
  add_index :topic_id
end

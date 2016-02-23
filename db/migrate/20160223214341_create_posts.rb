class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.text :text_post
      t.string :embed_url
      t.string :embed_url
      t.datetime :created_on
      t.integer :comments_id

      t.timestamps null: false
    end
  end
end

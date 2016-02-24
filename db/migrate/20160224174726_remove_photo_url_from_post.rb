class RemovePhotoUrlFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :photo_url
  end
end

class AddCoverPhotoUrlToSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :cover, :string
  end
end

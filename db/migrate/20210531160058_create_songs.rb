class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :album
      t.string :artist
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

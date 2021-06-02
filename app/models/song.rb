class Song < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  has_one_attached :cover_photo

  validates :title, :album, :artist, presence: true
end

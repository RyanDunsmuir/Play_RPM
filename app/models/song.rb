class Song < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  validates :title, :album, :artist, presence: true
end

class Song < ApplicationRecord
  belongs_to :user

  validates :title, :album, :artist, presence: true
end

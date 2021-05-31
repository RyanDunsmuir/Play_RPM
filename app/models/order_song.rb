class OrderSong < ApplicationRecord
  belongs_to :order
  belongs_to :song

  validates :order, :song, presence: true
  validates :order, uniqueness: { scope: :song }
end

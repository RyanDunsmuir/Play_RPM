class Order < ApplicationRecord
  belongs_to :user
  has_many :order_songs, dependent: :destroy
  has_many :songs, through: :order_songs

  validates :user, presence: true
end

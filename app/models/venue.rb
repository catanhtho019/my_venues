class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  validates :category, inclusion: { in: %(bar, pubs, restaurants, clubs) }
  has_many_attached :photo
end

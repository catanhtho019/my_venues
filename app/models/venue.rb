class Venue < ApplicationRecord
  has_many :bookings
  has_many :reviews
  belongs_to :user
  validates :category, inclusion: { in: %(bar, pubs, restaurants, clubs) } # @categories
end

class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  # validates :category, inclusion: { in: %(bar, pubs, restaurants, clubs) }
  has_many_attached :photo
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  mount_uploader :photo, PhotoUploader

end

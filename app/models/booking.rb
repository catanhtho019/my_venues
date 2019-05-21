class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  has_one :review
  validates :checkin_on, presence: true
  validates :checkout_on, presence: true
  validates :status, inclusion: { in: ["Pending guest request", "Pending host validation", "Confirmed", "Canceled"], allow_nil: true }
end

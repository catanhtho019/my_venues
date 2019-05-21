class Review < ApplicationRecord
  belongs_to :venue
  belongs_to :user
  validates :rating, inclusion: { in: 0..5 }
end

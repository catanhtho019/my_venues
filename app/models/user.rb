class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reviews
  has_many :bookings
  has_many :venues
  validates :first_name, :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :venues, dependent: :destroy
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :photo
  mount_uploader :photo, PhotoUploader
end

# Validate first, last name and email , regex for email

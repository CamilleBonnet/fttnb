class User < ApplicationRecord
  # validates :gender, presence: true, on: :update
  has_attachment :photo
  has_many :flats
  has_many :bookings

end

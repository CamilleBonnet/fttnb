class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_attachments :photos, maximum: 10
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end

class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_attachments :photos, maximum: 10

end

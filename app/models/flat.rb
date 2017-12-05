class Flat < ApplicationRecord
  belongs_to :user
  has_attachments :photo, maximum: 10
end

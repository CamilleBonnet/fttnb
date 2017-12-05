class User < ApplicationRecord

  validates :gender, presence: true, on: :update

  has_attachment :photo
end

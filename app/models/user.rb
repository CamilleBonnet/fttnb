class User < ApplicationRecord

  validates :gender, presence: true, on: :update
end

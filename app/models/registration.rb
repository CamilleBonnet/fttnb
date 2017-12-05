class Registration < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :user
end


# has_one :user
# has_many :users

# def user
#   User.find_by(registration_id: self.id)
# end


# def users
#   User.where(registration_id: self.id)
# end

# class User
#   belongs_to :registration

#   def registration
#     Registration.find(self.registration_id)
#   end
# end


class Instructor < ActiveRecord::Base
  has_many :courses
  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: true
end

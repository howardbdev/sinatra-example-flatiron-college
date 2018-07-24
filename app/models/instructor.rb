class Instructor < ActiveRecord::Base
  has_many :courses
  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: true

  # make sure the email format is correct:
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end

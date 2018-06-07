class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :students, through: :enrollments

  belongs_to :instructor

  validates :name, :description, presence: true
end

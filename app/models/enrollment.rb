class Enrollment < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  validates :student_id, presence: true
end 

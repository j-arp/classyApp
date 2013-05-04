class Section < ActiveRecord::Base
  belongs_to :semester
  belongs_to :course
  has_many :students
  attr_accessible :name, :number, :year, :semester_id, :course_id 

  def to_s
  	"#{course.name} #{semester.name} #{year}"
  end
end

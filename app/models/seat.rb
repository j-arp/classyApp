class Seat < ActiveRecord::Base
  belongs_to :student
  belongs_to :classroom
  attr_accessible :position, :row, :student_id, :classroom_id


  def to_s
  	"#{classroom.name}: #{row}-#{position}"
  end
end

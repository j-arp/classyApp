class Note < ActiveRecord::Base
  belongs_to :student
  attr_accessible :content, :student_id
end

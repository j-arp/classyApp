class Member < ActiveRecord::Base
  belongs_to :team
  belongs_to :student
  attr_accessible :title, :body, :team_id, :student_id
end

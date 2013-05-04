class Classification < ActiveRecord::Base
  attr_accessible :name, :year
  has_many :students
end

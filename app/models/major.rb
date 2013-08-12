class Major < ActiveRecord::Base
  attr_accessible :code, :name
  has_many :students
end

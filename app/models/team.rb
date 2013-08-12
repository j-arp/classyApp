class Team < ActiveRecord::Base
  attr_accessible :name, :repo
  has_many :members
  has_many :students, :through => :members
end

class Team < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: :slugged
  attr_accessible :name, :repo
  has_many :members
  has_many :students, :through => :members
end

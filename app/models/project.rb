class Project < ActiveRecord::Base
  paginates_per 10
  
  attr_accessible :name
  
  has_many :tasks
  validates :name, :presence => true
end

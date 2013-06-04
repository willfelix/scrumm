class Point < ActiveRecord::Base
  paginates_per 10
  
  attr_accessible :kind, :name
  
  validates :name, :presence => true
end

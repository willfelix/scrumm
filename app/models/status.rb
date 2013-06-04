class Status < ActiveRecord::Base
  paginates_per 10
  
  attr_accessible :title
  
  validates :title, :presence => true
end

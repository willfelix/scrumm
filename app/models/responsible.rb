class Responsible < ActiveRecord::Base
  paginates_per 10
  
  attr_accessible :name, :role
  
  validates :name, :presence => true, :length => { :minimum => 5 }
end

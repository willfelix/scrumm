class Sprint < ActiveRecord::Base
  paginates_per 10

  attr_accessible :date_begin, :date_final, :name
  
  validates :date_begin, :presence => true
  validates :date_final, :presence => true
  validates :name, :presence => true
  
  has_many :tasks, :dependent => :destroy
end

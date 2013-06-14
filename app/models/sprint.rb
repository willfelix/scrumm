class Sprint < ActiveRecord::Base
  paginates_per 10

  attr_accessible :date_begin, :date_final, :name, :points
  
  validates :date_begin, :presence => true, :uniqueness => true
  validates :date_final, :presence => true
  validates :name, :presence => true
  validates :points, :presence => true
  
  has_many :tasks, :dependent => :destroy
end

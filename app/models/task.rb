class Task < ActiveRecord::Base
  paginates_per 10

  belongs_to :sprint
  belongs_to :status
  belongs_to :project
  belongs_to :responsible
  belongs_to :point
  
  attr_accessible :description, :unplanned, :sprint_id, :status_id, :responsible_id, :point_id, :project_id
  
  validates :description, :presence => true
  validates :sprint_id, :presence => true
  validates :status_id, :presence => true
  validates :responsible_id, :presence => true
  validates :point_id, :presence => true
  
end

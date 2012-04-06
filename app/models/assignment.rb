class Assignment < ActiveRecord::Base
  attr_accessible :project_id, :researcher_id

  belongs_to :researcher 
  belongs_to :project 

  validates :project_id, :presence => true 
  validates :researcher_id, :presence => true
end

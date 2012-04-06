class Experiment < ActiveRecord::Base
  attr_accessible :name, :project_id, :researcher_id
  belongs_to :project
  belongs_to :researcher
  default_scope :order => 'experiments.created_at ASC'
end

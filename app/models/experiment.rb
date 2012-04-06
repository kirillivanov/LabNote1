class Experiment < ActiveRecord::Base
  attr_accessible :name, :project_id, :researcher_id
  belongs_to :project
  belongs_to :researcher
end

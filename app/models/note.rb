class Note < ActiveRecord::Base
  attr_accessible :text, :page_id, :experiment_id, :attachment
  belongs_to :page
  belongs_to :experiment
  default_scope :order => 'notes.created_at ASC'
end

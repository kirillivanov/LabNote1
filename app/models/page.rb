class Page < ActiveRecord::Base
  attr_accessible :text, :attachment, :notebook_id, :experiment_id
  belongs_to :notebook
  default_scope :order => 'pages.created_at ASC'
end

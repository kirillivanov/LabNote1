class Page < ActiveRecord::Base
  attr_accessible :text, :notebook_id
  belongs_to :notebook
  has_many :notes, :dependent => :destroy 
  default_scope :order => 'pages.created_at DESC'
end

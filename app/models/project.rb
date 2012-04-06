class Project < ActiveRecord::Base
  has_many :assignments
  has_many :researchers, :through => :assignments, :source => :researcher, :dependent => :destroy

  has_many :experiments, :dependent => :destroy 

  attr_accessible :name
end
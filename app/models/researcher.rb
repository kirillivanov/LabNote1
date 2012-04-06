class Researcher < ActiveRecord::Base

  has_many :assignments
  has_many :projects, :through => :assignments, :source => :project, :dependent => :destroy

  has_one :notebook, :dependent => :destroy	
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name
  
end

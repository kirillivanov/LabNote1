class Notebook < ActiveRecord::Base
  belongs_to :researcher
  has_many :pages, :dependent => :destroy 
end

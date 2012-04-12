class Project < ActiveRecord::Base
  has_many :assignments
  has_many :researchers, :through => :assignments, :source => :researcher, :dependent => :destroy

  has_many :experiments, :dependent => :destroy 

  attr_accessible :name

  def self.with_experiments(current_user)
    includes(:experiments).where("experiments.researcher_id = ?", current_user)
        #select { |p| p if p.experiments.count > 0 }
  end

  def self.with_other_user_experiments(current_user)
    select { |p| p if p.experiments.count > 0 && !p.researchers.include?(current_user) }
  end
end

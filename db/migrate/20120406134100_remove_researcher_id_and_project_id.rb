class RemoveResearcherIdAndProjectId < ActiveRecord::Migration
  def change
    remove_column :researchers, :project_id
    remove_column :projects, :researcher_id
  end
end

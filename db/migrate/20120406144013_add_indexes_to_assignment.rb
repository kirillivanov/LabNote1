class AddIndexesToAssignment < ActiveRecord::Migration
  def change
    add_index :assignments, :project_id
    add_index :assignments, :researcher_id
    add_index :assignments, [:project_id, :researcher_id], :unique => true
  end
end

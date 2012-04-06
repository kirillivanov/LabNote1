class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :researcher_id
      t.integer :project_id

      t.timestamps
    end
  end
end

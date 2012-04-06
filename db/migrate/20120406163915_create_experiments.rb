class CreateExperiments < ActiveRecord::Migration
  def self.up
    create_table :experiments do |t|
      t.string :name
      t.integer :project_id
      t.integer :researcher_id
      t.timestamps
    end
  end

  def self.down
    drop_table :experiments
  end
end

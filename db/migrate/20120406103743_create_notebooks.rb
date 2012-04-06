class CreateNotebooks < ActiveRecord::Migration
  def self.up
    create_table :notebooks do |t|
      t.integer :researcher_id
      t.timestamps
    end
  end

  def self.down
    drop_table :notebooks
  end
end

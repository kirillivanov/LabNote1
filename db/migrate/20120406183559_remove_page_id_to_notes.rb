class RemovePageIdToNotes < ActiveRecord::Migration
  def up
    remove_column :notes, :notebook_id
      end

  def down
    add_column :notes, :notebook_id, :integer
  end
end

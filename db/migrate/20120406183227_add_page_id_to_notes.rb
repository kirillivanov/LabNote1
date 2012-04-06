class AddPageIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :page_id, :integer
  end
end

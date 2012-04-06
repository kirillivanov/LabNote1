class RemoveOldFieldsAddNew < ActiveRecord::Migration
  def change
    remove_column :pages, :text
    remove_column :pages, :experiment_id 
    remove_column :pages, :attachment

    add_column :notes, :attachment, :string
  end
end

class AddFileSystemTypesToDocTypes < ActiveRecord::Migration
  def self.up
    add_column :doc_types, :file_filter, :string, :limit => 500
  end

  def self.down
    remove_column :doc_types, :file_filter
  end
end

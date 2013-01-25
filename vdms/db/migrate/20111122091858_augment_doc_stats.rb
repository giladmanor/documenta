class AugmentDocStats < ActiveRecord::Migration
  def self.up
    add_column :doc_stats, :code, :string
    add_column :doc_stats, :immutable, :boolean
  end

  def self.down
    remove_column :doc_stats, :code
    remove_column :doc_stats, :immutable
  end
end

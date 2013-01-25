class MoveDocStatToDocumentVersion < ActiveRecord::Migration
  def self.up
    add_column :document_versions, :doc_stat_id, :integer
    remove_column :documents, :doc_stat_id
  end

  def self.down
    add_column :documents, :doc_stat_id, :integer
    remove_column :document_versions, :doc_stat_id
  end
end

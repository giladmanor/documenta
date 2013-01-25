class CreateChangeProcessDocumentVersions < ActiveRecord::Migration
  def self.up
    create_table :change_process_document_versions do |t|
      t.references :change_process
      t.references :document_version

      t.timestamps
    end
  end

  def self.down
    drop_table :change_process_document_versions
  end
end

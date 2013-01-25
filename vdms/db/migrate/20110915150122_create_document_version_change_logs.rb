class CreateDocumentVersionChangeLogs < ActiveRecord::Migration
  def self.up
    create_table :document_version_change_logs do |t|
      t.references :document_version
      t.references :change_log

      t.timestamps
    end
  end

  def self.down
    drop_table :document_version_change_logs
  end
end

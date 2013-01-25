class CreateDocumentVersionTags < ActiveRecord::Migration
  def self.up
    create_table :document_version_tags do |t|
      t.references :document_version
      t.references :tag

      t.timestamps
    end
  end

  def self.down
    drop_table :document_version_tags
  end
end

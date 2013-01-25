class CreateDocumentVersions < ActiveRecord::Migration
  def self.up
    create_table :document_versions do |t|
      t.references :document
      t.string :file_name
      
      t.timestamps
    end
  end

  def self.down
    drop_table :document_versions
  end
end

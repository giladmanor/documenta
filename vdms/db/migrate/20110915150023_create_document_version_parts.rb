class CreateDocumentVersionParts < ActiveRecord::Migration
  def self.up
    create_table :document_version_parts do |t|
      t.references :document_version
      t.references :part_version

      t.timestamps
    end
  end

  def self.down
    drop_table :document_version_parts
  end
end

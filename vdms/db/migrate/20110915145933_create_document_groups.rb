class CreateDocumentGroups < ActiveRecord::Migration
  def self.up
    create_table :document_groups do |t|
      t.references :document
      t.references :group

      t.timestamps
    end
  end

  def self.down
    drop_table :document_groups
  end
end

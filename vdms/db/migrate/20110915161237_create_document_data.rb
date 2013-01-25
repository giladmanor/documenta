class CreateDocumentData < ActiveRecord::Migration
  def self.up
    create_table :document_data do |t|
      t.references :document_version
      t.binary :data

      t.timestamps
    end
  end

  def self.down
    drop_table :document_data
  end
end

class CreatePartVersionDrawingDocs < ActiveRecord::Migration
  def self.up
    create_table :part_version_drawing_docs do |t|
      t.references :part_version
      t.references :document_version

      t.timestamps
    end
  end

  def self.down
    drop_table :part_version_drawing_docs
  end
end

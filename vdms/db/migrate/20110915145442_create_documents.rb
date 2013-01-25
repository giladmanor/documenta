class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :name
      t.integer :parent_id
      t.integer :change_permission_level_id
      t.integer :read_permission_level_id
      t.references :doc_type
      t.references :doc_stat

      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end

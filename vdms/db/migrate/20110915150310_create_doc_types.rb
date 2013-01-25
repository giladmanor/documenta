class CreateDocTypes < ActiveRecord::Migration
  def self.up
    create_table :doc_types do |t|
      t.string :name
      t.string :implementor

      t.timestamps
    end
  end

  def self.down
    drop_table :doc_types
  end
end

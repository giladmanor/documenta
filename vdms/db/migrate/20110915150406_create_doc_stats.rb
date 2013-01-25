class CreateDocStats < ActiveRecord::Migration
  def self.up
    create_table :doc_stats do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :doc_stats
  end
end

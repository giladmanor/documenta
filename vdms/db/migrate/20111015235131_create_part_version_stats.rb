class CreatePartVersionStats < ActiveRecord::Migration
  def self.up
    create_table :part_version_stats do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end

  def self.down
    drop_table :part_version_stats
  end
end

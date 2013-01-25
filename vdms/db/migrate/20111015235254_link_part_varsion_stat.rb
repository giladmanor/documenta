class LinkPartVarsionStat < ActiveRecord::Migration
  def self.up
    add_column :part_versions, :part_version_stat_id, :integer
  end

  def self.down
    remove_column :part_versions, :part_version_stat_id
  end
end

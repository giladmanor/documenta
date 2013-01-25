class ChangeProcessAddStat < ActiveRecord::Migration
  def self.up
    add_column :change_processes, :change_process_stat_id, :integer
  end

  def self.down
    remove_column :change_processes, :change_process_stat_id
  end
end

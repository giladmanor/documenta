class ChangeStatAddValue < ActiveRecord::Migration
  def self.up
  add_column :change_stats, :value, :integer
  end

  def self.down
    remove_column :change_stats, :value
  end
end

class ChangeStatAddCode < ActiveRecord::Migration
  def self.up
    add_column :change_stats, :code, :string
  end

  def self.down
    remove_column :change_stats, :code
  end
end

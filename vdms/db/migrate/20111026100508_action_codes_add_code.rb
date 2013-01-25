class ActionCodesAddCode < ActiveRecord::Migration
  def self.up
    add_column :action_codes, :code, :string
  end

  def self.down
    remove_column :action_codes, :code
  end
end

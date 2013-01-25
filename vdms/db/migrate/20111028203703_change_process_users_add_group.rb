class ChangeProcessUsersAddGroup < ActiveRecord::Migration
   def self.up
    add_column :change_process_users, :bunch, :string
  end

  def self.down
    remove_column :change_process_users, :bunch
  end
end

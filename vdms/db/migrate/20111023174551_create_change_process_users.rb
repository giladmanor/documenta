class CreateChangeProcessUsers < ActiveRecord::Migration
  def self.up
    create_table :change_process_users do |t|
      t.references :change_process
      t.references :user
      t.integer :ord
      t.references :change_log

      t.timestamps
    end
  end

  def self.down
    drop_table :change_process_users
  end
end

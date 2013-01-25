class CreateChangeLogs < ActiveRecord::Migration
  def self.up
    create_table :change_logs do |t|
      t.references :user
      t.integer :delegate_id
      t.references :action_code
      t.text :comments
      t.references :change_stat

      t.timestamps
    end
  end

  def self.down
    drop_table :change_logs
  end
end

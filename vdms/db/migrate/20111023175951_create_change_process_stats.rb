class CreateChangeProcessStats < ActiveRecord::Migration
  def self.up
    create_table :change_process_stats do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :change_process_stats
  end
end

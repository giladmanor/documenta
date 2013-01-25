class CreateChangeStats < ActiveRecord::Migration
  def self.up
    create_table :change_stats do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :change_stats
  end
end

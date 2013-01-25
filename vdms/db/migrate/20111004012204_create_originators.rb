class CreateOriginators < ActiveRecord::Migration
  def self.up
    create_table :originators do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :originators
  end
end

class CreateOrigines < ActiveRecord::Migration
  def self.up
    create_table :origines do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :origines
  end
end

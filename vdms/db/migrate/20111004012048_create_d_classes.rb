class CreateDClasses < ActiveRecord::Migration
  def self.up
    create_table :d_classes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :d_classes
  end
end

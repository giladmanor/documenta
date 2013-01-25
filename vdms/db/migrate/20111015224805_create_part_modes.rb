class CreatePartModes < ActiveRecord::Migration
  def self.up
    create_table :part_modes do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end

  def self.down
    drop_table :part_modes
  end
end

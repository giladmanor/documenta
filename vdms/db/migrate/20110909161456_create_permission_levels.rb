class CreatePermissionLevels < ActiveRecord::Migration
  def self.up
    create_table :permission_levels do |t|
      t.string :name
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :permission_levels
  end
end

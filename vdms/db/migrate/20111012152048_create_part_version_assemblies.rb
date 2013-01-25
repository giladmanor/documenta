class CreatePartVersionAssemblies < ActiveRecord::Migration
  def self.up
    create_table :part_version_assemblies do |t|
      t.integer :parent_id
      t.references :part_version
      t.references :change_log

      t.timestamps
    end
  end

  def self.down
    drop_table :part_version_assemblies
  end
end

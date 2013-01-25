class CreatePartVersionRmas < ActiveRecord::Migration
  def self.up
    create_table :part_version_rmas do |t|
      t.references :part_version
      t.string :nomenclature
      t.string :uid_desc
      t.string :source_of_repair
      t.string :repair_ship_to
      t.text :configuration_note

      t.timestamps
    end
  end

  def self.down
    drop_table :part_version_rmas
  end
end

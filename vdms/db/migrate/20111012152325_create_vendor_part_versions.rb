class CreateVendorPartVersions < ActiveRecord::Migration
  def self.up
    create_table :vendor_part_versions do |t|
      t.references :vendor
      t.references :part_version
      t.string :part_number
      t.string :cage_code
      t.boolean :is_serialized
      t.boolean :is_dropship
      t.string :reciept_location
      t.string :ship_location
      t.string :uid_desc

      t.timestamps
    end
  end

  def self.down
    drop_table :vendor_part_versions
  end
end

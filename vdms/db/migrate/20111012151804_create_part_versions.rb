class CreatePartVersions < ActiveRecord::Migration
  def self.up
    create_table :part_versions do |t|
      t.references :part
      t.references :change_log
      t.references :group
      t.string :nomenclature
      t.string :cage_code
      t.string :configuration_item
      t.string :natl_stock_number
      t.references :part_mode
      t.references :vendor
      t.references :customer
      t.string :next_higher_assembly, :limit=>1000
      t.string :bug

      t.timestamps
    end
  end

  def self.down
    drop_table :part_versions
  end
end

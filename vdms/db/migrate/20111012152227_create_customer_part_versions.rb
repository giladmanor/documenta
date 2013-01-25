class CreateCustomerPartVersions < ActiveRecord::Migration
  def self.up
    create_table :customer_part_versions do |t|
      t.references :customer
      t.references :part_version
      t.string :part_number
      t.string :nomenclature

      t.timestamps
    end
  end

  def self.down
    drop_table :customer_part_versions
  end
end

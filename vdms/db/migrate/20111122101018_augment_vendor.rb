class AugmentVendor < ActiveRecord::Migration
  def self.up
    add_column :vendors, :contact_name, :string
    add_column :vendors, :email, :string
    add_column :vendors, :phone, :string
    add_column :vendors, :notes, :text
    
  end

  def self.down
    remove_column :vendors, :contact_name
    remove_column :vendors, :email
    remove_column :vendors, :phone
    remove_column :vendors, :notes
  end
end

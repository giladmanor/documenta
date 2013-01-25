class AugmentCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :ext_id, :string
    add_column :customers, :main_phone, :string
    add_column :customers, :main_fax, :string
    add_column :customers, :main_email, :string
    add_column :customers, :contact_first_name, :string
    add_column :customers, :contact_middle_name, :string
    add_column :customers, :contact_last_name, :string
    add_column :customers, :contact_title, :string
    add_column :customers, :contact_salutation, :string
    add_column :customers, :contact_phone, :string
    add_column :customers, :address1, :string
    add_column :customers, :address2, :string
    add_column :customers, :city, :string
    add_column :customers, :state, :string
    add_column :customers, :postal_code, :string
    add_column :customers, :country, :string
    add_column :customers, :contact_fax, :string
    add_column :customers, :contact_email, :string
    
  end

  def self.down
    remove_column :customers, :ext_id
    remove_column :customers, :main_phone
    remove_column :customers, :main_fax
    remove_column :customers, :main_email
    remove_column :customers, :contact_first_name
    remove_column :customers, :contact_middle_name
    remove_column :customers, :contact_last_name
    remove_column :customers, :contact_title 
    remove_column :customers, :contact_salutation 
    remove_column :customers, :contact_phone
    remove_column :customers, :address1
    remove_column :customers, :address2
    remove_column :customers, :city
    remove_column :customers, :state
    remove_column :customers, :postal_code
    remove_column :customers, :country
    remove_column :customers, :contact_fax
    remove_column :customers, :contact_email
  end
end

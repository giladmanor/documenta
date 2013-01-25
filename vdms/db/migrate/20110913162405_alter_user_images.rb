class AlterUserImages < ActiveRecord::Migration
  def self.up
    remove_column :users, :avatar
    add_column :users, :avatar, :binary
    remove_column :users, :signature_image
    add_column :users, :signature_image, :binary
  end

  def self.down
    remove_column :users, :avatar
    add_column :users, :avatar, :text
    remove_column :users, :signature_image
    add_column :users, :signature_image, :text
  end
end

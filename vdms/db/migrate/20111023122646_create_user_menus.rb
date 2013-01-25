class CreateUserMenus < ActiveRecord::Migration
  def self.up
    create_table :user_menus do |t|
      t.references :user
      t.references :module_permissions
      t.integer :ord

      t.timestamps
    end
  end

  def self.down
    drop_table :user_menus
  end
end

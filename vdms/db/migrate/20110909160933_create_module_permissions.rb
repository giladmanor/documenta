class CreateModulePermissions < ActiveRecord::Migration
  def self.up
    create_table :module_permissions do |t|
      t.string :name
      t.string :menu
      t.string :icon
      t.references :role
      t.string :implementor
      t.integer :change_permission_level_id
      t.integer :read_permission_level_id
      t.text :params

      t.timestamps
    end
    
    #add_index "module_permissions", ["role"], :name => "role"
    
    
  end

  def self.down
    drop_table :module_permissions
  end
end

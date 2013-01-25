class CreateUserGroups < ActiveRecord::Migration
  def self.up
    create_table :user_groups do |t|
      t.references :user
      t.references :group

      t.timestamps
    end
    
    #add_index "user_groups", ["user"], :name => "user"
    #add_index "user_groups", ["group"], :name => "group"
    
    
  end

  def self.down
    drop_table :user_groups
  end
end

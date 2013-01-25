class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :l_name
      t.string :email
      t.string :title
      t.string :password
      t.references :role
      t.references :permission_level
      t.integer :surrogate_id
      t.text :avatar
      t.text :signature_image

      t.timestamps
    end
    
    #add_index "users", ["email"], :name => "email"
    #add_index "users", ["password"], :name => "password"
    
  end

  def self.down
    drop_table :users
  end
end

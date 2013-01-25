class ExtractImagesFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :avatar
    remove_column :users, :signature_image
    
    create_table :avatars do |t|
      t.references :user
      t.binary :image

      t.timestamps
    end
    
    create_table :signatures do |t|
      t.references :user
      t.binary :image

      t.timestamps
    end
    
    
    
  end

  def self.down
    drop_table :avatars
    drop_table :signatures
  end
end

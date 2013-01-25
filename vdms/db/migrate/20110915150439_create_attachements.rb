class CreateAttachements < ActiveRecord::Migration
  def self.up
    create_table :attachements do |t|
      t.integer :owner_id
      t.integer :owned_id

      t.timestamps
    end
  end

  def self.down
    drop_table :attachements
  end
end

class CreateActionCodes < ActiveRecord::Migration
  def self.up
    create_table :action_codes do |t|
      t.string :name
      t.references :permission_level
      t.references :announce_template

      t.timestamps
    end
  end

  def self.down
    drop_table :action_codes
  end
end

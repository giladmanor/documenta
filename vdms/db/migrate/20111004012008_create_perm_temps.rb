class CreatePermTemps < ActiveRecord::Migration
  def self.up
    create_table :perm_temps do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :perm_temps
  end
end

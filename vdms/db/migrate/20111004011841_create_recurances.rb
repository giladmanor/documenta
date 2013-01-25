class CreateRecurances < ActiveRecord::Migration
  def self.up
    create_table :recurances do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :recurances
  end
end

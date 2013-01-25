class CreateSellers < ActiveRecord::Migration
  def self.up
    create_table :sellers do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :sellers
  end
end

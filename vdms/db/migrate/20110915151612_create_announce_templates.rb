class CreateAnnounceTemplates < ActiveRecord::Migration
  def self.up
    create_table :announce_templates do |t|
      t.string :name
      t.text :template

      t.timestamps
    end
  end

  def self.down
    drop_table :announce_templates
  end
end

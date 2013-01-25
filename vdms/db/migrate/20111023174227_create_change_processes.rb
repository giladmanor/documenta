class CreateChangeProcesses < ActiveRecord::Migration
  def self.up
    create_table :change_processes do |t|
      t.string :title
      t.text :desc
      t.references :group
      t.references :flow_step
      t.references :document_version

      t.timestamps
    end
  end

  def self.down
    drop_table :change_processes
  end
end

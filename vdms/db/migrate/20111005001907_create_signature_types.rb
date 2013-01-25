class CreateSignatureTypes < ActiveRecord::Migration
  def self.up
    create_table :signature_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :signature_types
  end
end

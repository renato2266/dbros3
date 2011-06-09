class CreateNameSocieties < ActiveRecord::Migration
  def self.up
    create_table :name_societies do |t|
      t.integer :name_id
      t.integer :society_id
      t.string :carica
      t.date :inizio_carica
      t.date :fine_carica
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :name_societies
  end
end

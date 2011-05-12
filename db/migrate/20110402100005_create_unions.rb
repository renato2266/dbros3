class CreateUnions < ActiveRecord::Migration
  def self.up
    create_table :unions do |t|
      t.string :denominazione
      t.string :sede
      t.text :descrizione
      t.integer :area_id

      t.timestamps
    end
  end

  def self.down
    drop_table :unions
  end
end

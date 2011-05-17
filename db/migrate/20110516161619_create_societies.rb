class CreateSocieties < ActiveRecord::Migration
  def self.up
    create_table :societies do |t|
      t.string :denominazione
      t.string :forma_giuridica
      t.string :sede
      t.text :altre_sedi
      t.string :cf_pi
      t.text :descrizione
      t.string :stato
      t.string :agenzia_mandataria
      t.date :data_inizio
      t.date :data_fine

      t.timestamps
    end
  end

  def self.down
    drop_table :societies
  end
end

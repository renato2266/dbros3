class CreateDossiersUnions < ActiveRecord::Migration
   def self.up
      create_table :dossiers_unions, :id=>false do |t|
        t.integer :dossier_id
        t.integer :union_id
    end
  end

    def self.down
      drop_table :dossiers_unions
    end
  end

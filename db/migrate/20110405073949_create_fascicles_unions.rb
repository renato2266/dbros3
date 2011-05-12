class CreateFasciclesUnions < ActiveRecord::Migration
  def self.up
    create_table :fascicles_unions, :id=>false do |t|
      t.integer :union_id
      t.integer :fascicle_id

      t.timestamps
    end
  end

  def self.down
    
    drop_table :fascicles_unions
  end
end
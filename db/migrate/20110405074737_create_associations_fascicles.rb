class CreateAssociationsFascicles < ActiveRecord::Migration
    def self.up
    create_table :associations_fascicles, :id=>false do |t|
      t.integer :association_id
      t.integer :fascicle_id

      t.timestamps
    end
  end

  def self.down
    
    drop_table :associations_fascicles
  end
end
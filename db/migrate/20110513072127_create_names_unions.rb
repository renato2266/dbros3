class CreateNamesUnions < ActiveRecord::Migration
  def self.up
    create_table :names_unions, :id=>false do |t|
      t.integer :name_id
      t.integer :union_id
  end
end

  def self.down
    drop_table :names_unions
  end
end


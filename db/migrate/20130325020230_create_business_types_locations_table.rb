class CreateBusinessTypesLocationsTable < ActiveRecord::Migration
  def up
    create_table :business_types_locations, :id => false do |t|
      t.integer :business_type_id
      t.integer :location_id
    end
    
    add_index :business_types_locations, :business_type_id
    add_index :business_types_locations, :location_id
  end

  def down
    drop_table :business_types_locations
  end
end

class ChangeCountiesToBusinessTypes < ActiveRecord::Migration
  def up
    rename_table :counties, :business_types
    rename_column :locations, :county_id, :business_type_id
    remove_index :locations, :county_id
    add_index :locations, :business_type_id
    rename_column :organizations, :county_id, :business_type_id
    remove_index :organizations, :county_id
    add_index :organizations, :business_type_id
  end

  def down
    rename_table :business_types, :counties
    rename_column :locations, :business_type_id, :county_id
    remove_index :locations, :business_type_id
    add_index :locations, :county_id
    rename_column :organizations, :business_type_id, :county_id
    remove_index :organizations, :business_type_id
    add_index :organizations, :county_id
  end
end

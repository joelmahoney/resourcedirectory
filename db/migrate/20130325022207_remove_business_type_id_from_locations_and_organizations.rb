class RemoveBusinessTypeIdFromLocationsAndOrganizations < ActiveRecord::Migration
  def up
    remove_column :locations, :business_type_id
    remove_column :organizations, :business_type_id
  end

  def down
    add_column :locations, :business_type_id, :integer
    add_index :locations, :business_type_id
    add_column :organizations, :business_type_id, :integer
    add_index :organizations, :business_type_id
  end
end

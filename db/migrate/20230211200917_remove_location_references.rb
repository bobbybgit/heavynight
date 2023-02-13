class RemoveLocationReferences < ActiveRecord::Migration[7.0]
  def change
    remove_index :groups, :location_id
    remove_index :venues, :location_id
    remove_column :groups, :location_id
    remove_column :venues, :location_id
  end
end

class RemoveLocation < ActiveRecord::Migration[7.0]
  def change
    remove_reference :groups, :locations 
    remove_reference :venues, :locations
    drop_table :locations
  end
end

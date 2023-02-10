class AddLocationRefToGroups < ActiveRecord::Migration[7.0]
  def change
    change_column_null :groups, :location_id, true
    change_column_null :groups, :event_setting_id, true
  end
end

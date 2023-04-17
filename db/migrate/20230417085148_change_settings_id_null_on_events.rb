class ChangeSettingsIdNullOnEvents < ActiveRecord::Migration[7.0]
  def change
    change_column_null :events, :event_setting_id, true
  end
end

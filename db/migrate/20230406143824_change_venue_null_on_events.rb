class ChangeVenueNullOnEvents < ActiveRecord::Migration[7.0]
  def change
    change_column_null :events, :venue_id, true
    change_column_null :events, :session_id, true
    change_column_null :events, :venue_id, true
  end
end

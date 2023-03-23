class ChangeColumnNullGamesUsersAndVenues < ActiveRecord::Migration[7.0]
  def change
    change_column_null :games, :user_id, true
    change_column_null :games, :venue_id, true
  end
end

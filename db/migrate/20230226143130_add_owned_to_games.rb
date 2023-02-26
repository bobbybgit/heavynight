class AddOwnedToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :owned, :boolean
  end
end

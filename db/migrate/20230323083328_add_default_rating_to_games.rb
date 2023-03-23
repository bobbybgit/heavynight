class AddDefaultRatingToGames < ActiveRecord::Migration[7.0]
  def change

    change_column :games, :rating, :string, :default => "Not Rated"
    change_column :games, :min_rec_player_count, :string
    change_column :games, :max_rec_player_count, :string

  end
end

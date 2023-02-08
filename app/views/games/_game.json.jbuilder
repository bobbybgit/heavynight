json.extract! game, :id, :bgg_id, :min_player_count, :max_player_count, :min_rec_player_count, :max_rec_player_count, :image, :weight, :rating, :description, :user_id, :venue_id, :created_at, :updated_at
json.url game_url(game, format: :json)

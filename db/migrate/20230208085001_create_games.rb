class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :bgg_id
      t.integer :min_player_count
      t.integer :max_player_count
      t.integer :min_rec_player_count
      t.integer :max_rec_player_count
      t.string :image
      t.float :weight
      t.float :rating
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end

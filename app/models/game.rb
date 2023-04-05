class Game < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :venue, optional: true

  scope :mine, -> (current_user_id){where(user_id: current_user_id)}
  scope :rated_by_me, -> {where.not(rating: "Not Rated")}
  scope :bgg_game, -> (game){where(bgg_id: game)}
  scope :owned_by_me, -> {where(owned: true)}
  scope :owned_by_user, ->(users) {where(user_id: users, owned: true)}

end

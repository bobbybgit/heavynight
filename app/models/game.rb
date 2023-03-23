class Game < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :venue, optional: true

  scope :mine, -> (current_user_id, game){where(user_id: current_user_id) && where(bgg_id: game)}

end

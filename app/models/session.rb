class Session < ApplicationRecord
  belongs_to :game
  belongs_to :event
  belongs_to :user
end

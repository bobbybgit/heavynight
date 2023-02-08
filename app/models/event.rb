class Event < ApplicationRecord
  belongs_to :group
  belongs_to :venue
  belongs_to :event_setting
  belongs_to :session
end

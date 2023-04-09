class Event < ApplicationRecord
  belongs_to :group
  belongs_to :venue, optional: true
  belongs_to :event_setting, optional: true
  belongs_to :session, optional: true
end

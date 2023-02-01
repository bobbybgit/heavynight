class Group < ApplicationRecord
  belongs_to :location
  belongs_to :event_setting
end

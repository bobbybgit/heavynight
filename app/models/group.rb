class Group < ApplicationRecord
  belongs_to :location, optional:true
  belongs_to :event_setting, optional:true
end
